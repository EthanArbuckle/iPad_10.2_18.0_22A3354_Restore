@implementation OSLogTermDumper

- (BOOL)isBold
{
  return (self->_cur_attrs >> 5) & 1;
}

- (BOOL)isOblique
{
  return (self->_cur_attrs >> 6) & 1;
}

- (BOOL)isUnderlined
{
  return (self->_cur_attrs >> 7) & 1;
}

- (unsigned)bgColor
{
  return self->_cur_attrs & 0x1F;
}

- (unsigned)fgColor
{
  return HIBYTE(self->_cur_attrs) & 0x1F;
}

- (void)setBold:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_cur_attrs = self->_cur_attrs & 0xFFDF | v3;
}

- (void)setOblique:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_cur_attrs = self->_cur_attrs & 0xFFBF | v3;
}

- (void)setUnderline:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_cur_attrs = self->_cur_attrs & 0xFF7F | v3;
}

- (void)setBgColor:(unsigned __int8)a3
{
  self->_cur_attrs = self->_cur_attrs & 0xFFE0 | a3;
}

- (void)setFgColor:(unsigned __int8)a3
{
  self->_cur_attrs = self->_cur_attrs & 0xE0FF | (a3 << 8);
}

- (void)resetStyle
{
  self->_cur_attrs = 4112;
}

- (OSLogTermDumper)init
{
  return -[OSLogTermDumper initWithFd:colorMode:](self, "initWithFd:colorMode:", 1, 0);
}

- (OSLogTermDumper)initWithFd:(int)a3 colorMode:(unsigned __int8)a4
{
  int v4;
  OSLogTermDumper *v6;
  OSLogTermDumper *v7;
  char *v8;
  BOOL v9;
  char *v10;
  const char *v11;
  int v12;
  BOOL v13;
  objc_super v15;

  v4 = a4;
  v15.receiver = self;
  v15.super_class = (Class)OSLogTermDumper;
  v6 = -[OSLogTermDumper init](&v15, sel_init);
  v7 = v6;
  if (!v6)
    return v7;
  v6->_ob.var0.ob_b = (char *)v6->_ob_slop;
  *(_QWORD *)&v6->_ob.ob_len = 0x100000000;
  v6->_ob.ob_flags = 0;
  v6->_ob.ob_binary = 0;
  v6->_ob.ob_maxsize = 0x100000;
  v6->_fd = a3;
  v6->_last_attrs = 4112;
  v6->_cur_attrs = 4112;
  v6->_colorMode = v4;
  v8 = getenv("LOG_USE_ESCAPECNTRLCHARS");
  v9 = !v8 || strcmp(v8, "0");
  v7->_vis = v9;
  v10 = getenv("TERM");
  switch(v4)
  {
    case 0:
      v11 = v10;
      v12 = isatty(a3);
      if (!v11 || !v12 || !strcmp(v11, "dummy"))
        return v7;
      if (!strcasestr(v11, "ansi"))
      {
        v13 = strcasestr(v11, "color") != 0;
        goto LABEL_15;
      }
LABEL_14:
      v13 = 1;
LABEL_15:
      v7->_fancy = v13;
      return v7;
    case 2:
      goto LABEL_14;
    case 1:
      v7->_fancy = 0;
      break;
  }
  return v7;
}

- (void)close
{
  char *ob_b;

  -[OSLogTermDumper resetStyle](self, "resetStyle");
  -[OSLogTermDumper flush:](self, "flush:", 1);
  if ((self->_ob.ob_flags & 1) != 0)
  {
    ob_b = self->_ob.var0.ob_b;
    self->_ob.var0.ob_b = (char *)3954044928;
    self->_ob.ob_flags = 0;
    free(ob_b);
  }
  self->_ob.var0.ob_b = (char *)self->_ob_slop;
  *(_QWORD *)&self->_ob.ob_len = 0x100000000;
  self->_ob.ob_maxsize = 0;
  self->_ob.ob_flags = 0;
  self->_ob.ob_binary = 0;
}

- (void)dealloc
{
  char *ob_b;
  objc_super v4;

  if ((self->_ob.ob_flags & 1) != 0)
  {
    ob_b = self->_ob.var0.ob_b;
    self->_ob.var0.ob_b = (char *)3954044928;
    self->_ob.ob_flags = 0;
    free(ob_b);
  }
  v4.receiver = self;
  v4.super_class = (Class)OSLogTermDumper;
  -[OSLogTermDumper dealloc](&v4, sel_dealloc);
}

- (void)startPager
{
  pid_t v2;
  pid_t v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  _QWORD v10[4];
  pid_t v11;
  uint64_t v12;
  int v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_fancy)
    return;
  v12 = 0;
  ioctl(self->_fd, 0x40087468uLL, &v12);
  if (!getenv("LESS"))
    putenv("LESS=FnRSX");
  if (!getenv("LESSCHARSET"))
    putenv("LESSCHARSET=utf-8");
  if (pipe(v13) < 0)
    return;
  v2 = fork();
  if (v2 < 0)
    return;
  v3 = v2;
  if (v2)
  {
    dup2(v13[1], 1);
    if (close(v13[1]) == -1)
    {
      v4 = *__error();
      v5 = *__error();
      if (v4 == 9)
      {
        qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1EE52EA88 = v5;
        __break(1u);
LABEL_25:
        qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1EE52EA88 = v5;
        __break(1u);
LABEL_26:
        perror("execvp");
        exit(1);
      }
      _os_assumes_log();
    }
    if (close(v13[0]) != -1)
    {
LABEL_11:
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __29__OSLogTermDumper_startPager__block_invoke;
      v10[3] = &__block_descriptor_36_e5_v8__0l;
      v11 = v3;
      atexit_b(v10);
      return;
    }
    v6 = *__error();
    v5 = *__error();
    if (v6 != 9)
    {
      _os_assumes_log();
      goto LABEL_11;
    }
    goto LABEL_25;
  }
  dup2(v13[0], 0);
  if (close(v13[0]) == -1)
  {
    v7 = *__error();
    v8 = *__error();
    if (v7 == 9)
    {
      qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_1EE52EA88 = v8;
      __break(1u);
      goto LABEL_28;
    }
    _os_assumes_log();
  }
  if (close(v13[1]) != -1)
    goto LABEL_14;
  v9 = *__error();
  v8 = *__error();
  if (v9 == 9)
  {
LABEL_28:
    qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_1EE52EA88 = v8;
    __break(1u);
    return;
  }
  _os_assumes_log();
LABEL_14:
  if (execlp("less", "less", "-", 0) < 0)
    goto LABEL_26;
}

- (void)_flushAttrs
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int cur_attrs;
  __int16 v9;
  os_trace_blob_s *p_ob;
  unsigned __int16 ob_flags;
  uint64_t ob_len;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  unsigned __int16 v17;
  uint64_t v18;
  char *v19;
  unsigned int v20;
  uint64_t v21;
  unsigned __int16 v22;
  uint64_t v23;
  char *v24;
  unsigned int v25;
  uint64_t v26;
  unsigned __int16 v27;
  uint64_t v28;
  char *v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  unsigned int v34;
  uint64_t v35;
  char *v36;
  unsigned int v37;
  char *v38;
  uint64_t v39;
  size_t v40;
  char *v41;
  uint64_t v42;
  size_t v43;
  char *v44;
  uint64_t v45;
  size_t v46;

  cur_attrs = self->_cur_attrs;
  v9 = cur_attrs ^ self->_last_attrs;
  if (v9)
  {
    p_ob = &self->_ob;
    ob_flags = self->_ob.ob_flags;
    if (cur_attrs == 4112)
    {
      if ((ob_flags & 2) == 0)
      {
        ob_len = self->_ob.ob_len;
        if ((self->_ob.ob_binary + self->_ob.ob_size - ob_len - 1) <= 3)
        {
          os_trace_blob_add_slow((uint64_t)&self->_ob, "\x1B[0m", 4uLL);
        }
        else
        {
          *(_DWORD *)&self->_ob.var0.ob_b[ob_len] = 1831885595;
          v14 = self->_ob.ob_len + 4;
          self->_ob.ob_len = v14;
          if (!self->_ob.ob_binary)
            p_ob->var0.ob_b[v14] = 0;
        }
      }
LABEL_56:
      self->_last_attrs = self->_cur_attrs;
      return;
    }
    if ((ob_flags & 2) == 0)
    {
      v15 = self->_ob.ob_len;
      if ((self->_ob.ob_binary + self->_ob.ob_size - v15 - 1) <= 1)
      {
        os_trace_blob_add_slow((uint64_t)&self->_ob, "\x1B[", 2uLL);
        if ((v9 & 0x20) == 0)
          goto LABEL_21;
LABEL_12:
        v17 = self->_ob.ob_flags;
        if ((self->_cur_attrs & 0x20) != 0)
        {
          if ((v17 & 2) != 0)
            goto LABEL_21;
          v21 = self->_ob.ob_len;
          if ((self->_ob.ob_binary + self->_ob.ob_size - v21 - 1) > 1)
          {
            *(_WORD *)&self->_ob.var0.ob_b[v21] = 15153;
            v20 = self->_ob.ob_len + 2;
LABEL_19:
            self->_ob.ob_len = v20;
            if (!self->_ob.ob_binary)
              p_ob->var0.ob_b[v20] = 0;
LABEL_21:
            if ((v9 & 0x40) == 0)
              goto LABEL_31;
            v22 = self->_ob.ob_flags;
            if ((self->_cur_attrs & 0x40) != 0)
            {
              if ((v22 & 2) != 0)
                goto LABEL_31;
              v26 = self->_ob.ob_len;
              if ((self->_ob.ob_binary + self->_ob.ob_size - v26 - 1) > 1)
              {
                *(_WORD *)&self->_ob.var0.ob_b[v26] = 15155;
                v25 = self->_ob.ob_len + 2;
LABEL_29:
                self->_ob.ob_len = v25;
                if (!self->_ob.ob_binary)
                  p_ob->var0.ob_b[v25] = 0;
LABEL_31:
                if ((v9 & 0x80) == 0)
                  goto LABEL_41;
                goto LABEL_32;
              }
              v41 = "3;";
              v42 = (uint64_t)p_ob;
              v43 = 2;
            }
            else
            {
              if ((v22 & 2) != 0)
                goto LABEL_31;
              v23 = self->_ob.ob_len;
              if ((self->_ob.ob_binary + self->_ob.ob_size - v23 - 1) > 2)
              {
                v24 = &self->_ob.var0.ob_b[v23];
                v24[2] = 59;
                *(_WORD *)v24 = 13362;
                v25 = self->_ob.ob_len + 3;
                goto LABEL_29;
              }
              v41 = "24;";
              v42 = (uint64_t)p_ob;
              v43 = 3;
            }
            os_trace_blob_add_slow(v42, v41, v43);
            if ((v9 & 0x80) == 0)
              goto LABEL_41;
LABEL_32:
            v27 = self->_ob.ob_flags;
            if ((self->_cur_attrs & 0x80) != 0)
            {
              if ((v27 & 2) == 0)
              {
                v31 = self->_ob.ob_len;
                if ((self->_ob.ob_binary + self->_ob.ob_size - v31 - 1) > 1)
                {
                  *(_WORD *)&self->_ob.var0.ob_b[v31] = 15156;
                  v30 = self->_ob.ob_len + 2;
LABEL_39:
                  self->_ob.ob_len = v30;
                  if (!self->_ob.ob_binary)
                    p_ob->var0.ob_b[v30] = 0;
                  goto LABEL_41;
                }
                v44 = "4;";
                v45 = (uint64_t)p_ob;
                v46 = 2;
                goto LABEL_72;
              }
            }
            else if ((v27 & 2) == 0)
            {
              v28 = self->_ob.ob_len;
              if ((self->_ob.ob_binary + self->_ob.ob_size - v28 - 1) > 2)
              {
                v29 = &self->_ob.var0.ob_b[v28];
                v29[2] = 59;
                *(_WORD *)v29 = 13362;
                v30 = self->_ob.ob_len + 3;
                goto LABEL_39;
              }
              v44 = "24;";
              v45 = (uint64_t)p_ob;
              v46 = 3;
LABEL_72:
              os_trace_blob_add_slow(v45, v44, v46);
            }
LABEL_41:
            if ((v9 & 0x1F) != 0)
            {
              if ((self->_cur_attrs & 0x1F) == 0x10)
              {
                if ((self->_ob.ob_flags & 2) == 0)
                {
                  v32 = self->_ob.ob_len;
                  if ((self->_ob.ob_binary + self->_ob.ob_size - v32 - 1) <= 2)
                  {
                    os_trace_blob_add_slow((uint64_t)p_ob, "49;", 3uLL);
                  }
                  else
                  {
                    v33 = &self->_ob.var0.ob_b[v32];
                    v33[2] = 59;
                    *(_WORD *)v33 = 14644;
                    v34 = self->_ob.ob_len + 3;
                    self->_ob.ob_len = v34;
                    if (!self->_ob.ob_binary)
                      p_ob->var0.ob_b[v34] = 0;
                  }
                }
              }
              else
              {
                os_trace_blob_addf((uint64_t)p_ob, "48;5;%d;", v2, v3, v4, v5, v6, v7, self->_cur_attrs & 0x1F);
              }
            }
            if ((v9 & 0x1F00) != 0)
            {
              if ((HIBYTE(self->_cur_attrs) & 0x1F) == 0x10)
              {
                if ((self->_ob.ob_flags & 2) == 0)
                {
                  v35 = self->_ob.ob_len;
                  if ((self->_ob.ob_binary + self->_ob.ob_size - v35 - 1) <= 2)
                  {
                    os_trace_blob_add_slow((uint64_t)p_ob, "39;", 3uLL);
                  }
                  else
                  {
                    v36 = &self->_ob.var0.ob_b[v35];
                    v36[2] = 59;
                    *(_WORD *)v36 = 14643;
                    v37 = self->_ob.ob_len + 3;
                    self->_ob.ob_len = v37;
                    if (!self->_ob.ob_binary)
                      p_ob->var0.ob_b[v37] = 0;
                  }
                }
              }
              else
              {
                os_trace_blob_addf((uint64_t)p_ob, "38;5;%d;", v2, v3, v4, v5, v6, v7, HIBYTE(self->_cur_attrs) & 0x1F);
              }
            }
            self->_ob.var0.ob_b[self->_ob.ob_len - 1] = 109;
            goto LABEL_56;
          }
          v38 = "1;";
          v39 = (uint64_t)p_ob;
          v40 = 2;
        }
        else
        {
          if ((v17 & 2) != 0)
            goto LABEL_21;
          v18 = self->_ob.ob_len;
          if ((self->_ob.ob_binary + self->_ob.ob_size - v18 - 1) > 2)
          {
            v19 = &self->_ob.var0.ob_b[v18];
            v19[2] = 59;
            *(_WORD *)v19 = 12850;
            v20 = self->_ob.ob_len + 3;
            goto LABEL_19;
          }
          v38 = "22;";
          v39 = (uint64_t)p_ob;
          v40 = 3;
        }
        os_trace_blob_add_slow(v39, v38, v40);
        goto LABEL_21;
      }
      *(_WORD *)&self->_ob.var0.ob_b[v15] = 23323;
      v16 = self->_ob.ob_len + 2;
      self->_ob.ob_len = v16;
      if (!self->_ob.ob_binary)
        p_ob->var0.ob_b[v16] = 0;
    }
    if ((v9 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_12;
  }
}

- (void)_resetAttrsForNewline
{
  os_trace_blob_s *p_ob;
  uint64_t ob_len;
  char *v5;
  unsigned int v6;
  unsigned __int16 cur_attrs;

  if (self->_last_attrs)
  {
    if ((self->_cur_attrs & 0x1F) != 0x10 && (self->_ob.ob_flags & 2) == 0)
    {
      p_ob = &self->_ob;
      ob_len = self->_ob.ob_len;
      if ((self->_ob.ob_binary + self->_ob.ob_size - ob_len - 1) <= 2)
      {
        os_trace_blob_add_slow((uint64_t)p_ob, "\x1B[K", 3uLL);
      }
      else
      {
        v5 = &self->_ob.var0.ob_b[ob_len];
        v5[2] = 75;
        *(_WORD *)v5 = 23323;
        v6 = self->_ob.ob_len + 3;
        self->_ob.ob_len = v6;
        if (!self->_ob.ob_binary)
          p_ob->var0.ob_b[v6] = 0;
      }
    }
    cur_attrs = self->_cur_attrs;
    self->_cur_attrs = 4112;
    -[OSLogTermDumper _flushAttrs](self, "_flushAttrs");
    self->_cur_attrs = cur_attrs;
  }
}

- (void)beginEditing
{
  if (self->_fancy && self->_last_attrs != self->_cur_attrs)
    -[OSLogTermDumper _flushAttrs](self, "_flushAttrs");
}

- (void)endEditing
{
  if (self->_ob.ob_len >= 0x2000)
    -[OSLogTermDumper flush:](self, "flush:", 0);
}

- (void)flush:(BOOL)a3
{
  if (a3 && self->_fancy && self->_last_attrs != self->_cur_attrs)
    -[OSLogTermDumper _flushAttrs](self, "_flushAttrs");
  _os_trace_write();
  self->_ob.ob_len = 0;
  if (!self->_ob.ob_binary)
    *self->_ob.var0.ob_b = 0;
}

- (void)write:(const void *)a3 size:(unint64_t)a4
{
  size_t v4;
  void *v5;
  os_trace_blob_s *p_ob;
  char *v8;
  char *v9;
  int64_t v10;
  unint64_t v11;
  uint64_t ob_len;
  unsigned int v13;
  size_t v14;
  char v15;
  uint64_t v16;
  unsigned int v17;
  os_trace_blob_s *v18;
  uint64_t v19;
  unsigned int v20;
  char __src;

  v4 = a4;
  v5 = (void *)a3;
  if (self->_fancy)
  {
    if (a4)
    {
      p_ob = &self->_ob;
      do
      {
        v8 = (char *)memchr(v5, 10, v4);
        v9 = v8;
        v10 = v8 - (_BYTE *)v5;
        if (v8)
          v11 = v8 - (_BYTE *)v5;
        else
          v11 = v4;
        if (self->_fancy && self->_last_attrs != self->_cur_attrs)
          -[OSLogTermDumper _flushAttrs](self, "_flushAttrs");
        if (self->_vis)
        {
          os_trace_blob_add_unsafe_bytes((uint64_t)&self->_ob, (char *)v5, v11);
        }
        else if ((self->_ob.ob_flags & 2) == 0)
        {
          ob_len = self->_ob.ob_len;
          if (v11 > (self->_ob.ob_binary + self->_ob.ob_size - ob_len - 1))
          {
            os_trace_blob_add_slow((uint64_t)&self->_ob, v5, v11);
          }
          else
          {
            memcpy(&self->_ob.var0.ob_b[ob_len], v5, v11);
            v13 = self->_ob.ob_len + v11;
            self->_ob.ob_len = v13;
            if (!self->_ob.ob_binary)
              p_ob->var0.ob_b[v13] = 0;
          }
        }
        v14 = v4;
        if (v9)
        {
          if (self->_fancy && self->_last_attrs)
            -[OSLogTermDumper _resetAttrsForNewline](self, "_resetAttrsForNewline");
          v15 = *v9;
          __src = *v9;
          if ((self->_ob.ob_flags & 2) == 0)
          {
            v16 = self->_ob.ob_len;
            if (self->_ob.ob_binary + self->_ob.ob_size - 1 == (_DWORD)v16)
            {
              os_trace_blob_add_slow((uint64_t)&self->_ob, &__src, 1uLL);
            }
            else
            {
              self->_ob.var0.ob_b[v16] = v15;
              v17 = self->_ob.ob_len + 1;
              self->_ob.ob_len = v17;
              if (!self->_ob.ob_binary)
                p_ob->var0.ob_b[v17] = 0;
            }
          }
          v5 = v9 + 1;
          v14 = v10 + 1;
        }
        if (self->_ob.ob_len >= 0x2000)
          -[OSLogTermDumper flush:](self, "flush:", 0);
        v4 -= v14;
      }
      while (v4);
    }
  }
  else
  {
    v18 = &self->_ob;
    if (self->_vis)
    {
      os_trace_blob_add_unsafe_bytes((uint64_t)&self->_ob, (char *)a3, a4);
    }
    else if ((self->_ob.ob_flags & 2) == 0)
    {
      v19 = self->_ob.ob_len;
      if ((self->_ob.ob_binary + self->_ob.ob_size - v19 - 1) < a4)
      {
        os_trace_blob_add_slow((uint64_t)&self->_ob, (void *)a3, a4);
      }
      else
      {
        memcpy(&self->_ob.var0.ob_b[v19], a3, a4);
        v20 = self->_ob.ob_len + v4;
        self->_ob.ob_len = v20;
        if (!self->_ob.ob_binary)
          v18->var0.ob_b[v20] = 0;
      }
    }
    if (self->_ob.ob_len >= 0x2000)
      -[OSLogTermDumper flush:](self, "flush:", 0);
  }
}

- (void)putc:(int)a3
{
  os_trace_blob_s *p_ob;
  uint64_t ob_len;
  unsigned int v7;
  char __src;

  if (self->_fancy && self->_last_attrs != self->_cur_attrs)
    -[OSLogTermDumper _flushAttrs](self, "_flushAttrs");
  if (a3 == 10 && self->_fancy && self->_last_attrs)
    -[OSLogTermDumper _resetAttrsForNewline](self, "_resetAttrsForNewline");
  __src = a3;
  if ((self->_ob.ob_flags & 2) == 0)
  {
    p_ob = &self->_ob;
    ob_len = self->_ob.ob_len;
    if (self->_ob.ob_binary + self->_ob.ob_size - 1 == (_DWORD)ob_len)
    {
      os_trace_blob_add_slow((uint64_t)p_ob, &__src, 1uLL);
    }
    else
    {
      self->_ob.var0.ob_b[ob_len] = a3;
      v7 = self->_ob.ob_len + 1;
      self->_ob.ob_len = v7;
      if (!self->_ob.ob_binary)
        p_ob->var0.ob_b[v7] = 0;
    }
  }
  if (self->_ob.ob_len >= 0x2000)
    -[OSLogTermDumper flush:](self, "flush:", 0);
}

- (unsigned)vformat:(const char *)a3 args:(char *)a4
{
  unsigned int v5;
  unsigned int v6;
  char *v8;

  v8 = 0;
  v5 = vasprintf(&v8, a3, a4);
  if (!v8)
    return 0;
  v6 = v5;
  -[OSLogTermDumper write:size:](self, "write:size:", v8, v5);
  free(v8);
  return v6;
}

- (void)hexdump:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  int v10;
  _BYTE *v11;
  uint64_t ob_len;
  char *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  unsigned int v25;
  os_trace_blob_s *p_ob;
  char v27;
  _BYTE __src[74];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v7 = 0;
    p_ob = &self->_ob;
    do
    {
      v8 = v7 & 0xF;
      if ((v7 & 0xF) == 0)
      {
        __sprintf_chk(__src, 0, 0x4AuLL, "%08x:", v7);
        *(_QWORD *)&v9 = 0x2020202020202020;
        *((_QWORD *)&v9 + 1) = 0x2020202020202020;
        *(_OWORD *)&__src[9] = v9;
        *(_OWORD *)&__src[25] = v9;
        *(_OWORD *)&__src[41] = v9;
        *(_OWORD *)&__src[57] = v9;
        __src[73] = 32;
      }
      v10 = *((char *)a3 + v7);
      v11 = &__src[3 * v8 + 10];
      *v11 = a0123456789abcd[*((_BYTE *)a3 + v7) >> 4];
      v11[1] = a0123456789abcd[v10 & 0xF];
      if (v10 < 0 || v10 != 32 && (*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v10 + 60) & 0x200) != 0)
        LOBYTE(v10) = 46;
      __src[v8 + 58] = v10;
      if (v8 == 15)
      {
        if (self->_fancy && self->_last_attrs != self->_cur_attrs)
          -[OSLogTermDumper _flushAttrs](self, "_flushAttrs");
        if ((self->_ob.ob_flags & 2) == 0)
        {
          ob_len = self->_ob.ob_len;
          if ((self->_ob.ob_binary + self->_ob.ob_size - ob_len - 1) <= 0x49)
          {
            os_trace_blob_add_slow((uint64_t)p_ob, __src, 0x4AuLL);
          }
          else
          {
            v13 = &self->_ob.var0.ob_b[ob_len];
            *(_OWORD *)v13 = *(_OWORD *)__src;
            v14 = *(_OWORD *)&__src[16];
            v15 = *(_OWORD *)&__src[32];
            v16 = *(_OWORD *)&__src[48];
            *(_OWORD *)(v13 + 58) = *(_OWORD *)&__src[58];
            *((_OWORD *)v13 + 2) = v15;
            *((_OWORD *)v13 + 3) = v16;
            *((_OWORD *)v13 + 1) = v14;
            v17 = self->_ob.ob_len + 74;
            self->_ob.ob_len = v17;
            if (!self->_ob.ob_binary)
              p_ob->var0.ob_b[v17] = 0;
          }
        }
        if (self->_fancy && self->_last_attrs)
          -[OSLogTermDumper _resetAttrsForNewline](self, "_resetAttrsForNewline");
        v27 = 10;
        if ((self->_ob.ob_flags & 2) == 0)
        {
          v18 = self->_ob.ob_len;
          if (self->_ob.ob_binary + self->_ob.ob_size - 1 == (_DWORD)v18)
          {
            os_trace_blob_add_slow((uint64_t)p_ob, &v27, 1uLL);
          }
          else
          {
            self->_ob.var0.ob_b[v18] = 10;
            v19 = self->_ob.ob_len + 1;
            self->_ob.ob_len = v19;
            if (!self->_ob.ob_binary)
              p_ob->var0.ob_b[v19] = 0;
          }
        }
      }
      if (self->_ob.ob_len >= 0x2000)
        -[OSLogTermDumper flush:](self, "flush:", 0);
      ++v7;
    }
    while (a4 != v7);
    if ((a4 & 0xF) != 0 && (self->_ob.ob_flags & 2) == 0)
    {
      v20 = self->_ob.ob_len;
      if ((self->_ob.ob_binary + self->_ob.ob_size - v20 - 1) <= 0x49)
      {
        os_trace_blob_add_slow((uint64_t)p_ob, __src, 0x4AuLL);
      }
      else
      {
        v21 = &self->_ob.var0.ob_b[v20];
        *(_OWORD *)v21 = *(_OWORD *)__src;
        v22 = *(_OWORD *)&__src[16];
        v23 = *(_OWORD *)&__src[32];
        v24 = *(_OWORD *)&__src[48];
        *(_OWORD *)(v21 + 58) = *(_OWORD *)&__src[58];
        *((_OWORD *)v21 + 2) = v23;
        *((_OWORD *)v21 + 3) = v24;
        *((_OWORD *)v21 + 1) = v22;
        v25 = self->_ob.ob_len + 74;
        self->_ob.ob_len = v25;
        if (!self->_ob.ob_binary)
          p_ob->var0.ob_b[v25] = 0;
      }
    }
  }
  if (self->_ob.ob_len >= 0x2000)
    -[OSLogTermDumper flush:](self, "flush:", 0);
}

- (void)writeln
{
  -[OSLogTermDumper putc:](self, "putc:", 10);
}

- (void)pad:(int)a3 count:(unint64_t)a4
{
  char *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = (char *)v7 - ((a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  memset(v6, a3, a4);
  -[OSLogTermDumper write:size:](self, "write:size:", v6, a4);
}

- (unsigned)format:(const char *)a3
{
  uint64_t v4;

  return -[OSLogTermDumper vformat:args:](self, "vformat:args:", a3, &v4);
}

- (void)puts:(const char *)a3
{
  -[OSLogTermDumper write:size:](self, "write:size:", a3, strlen(a3));
}

- (void)putUUID:(unsigned __int8)a3[16]
{
  _BYTE v4[37];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(v4, 0, sizeof(v4));
  uuid_unparse_upper(a3, v4);
  -[OSLogTermDumper write:size:](self, "write:size:", v4, 36);
}

- (unsigned)colorMode
{
  return self->_colorMode;
}

- (BOOL)isFancy
{
  return self->_fancy;
}

- (unsigned)style
{
  return self->_cur_attrs;
}

- (void)setStyle:(unsigned __int16)a3
{
  self->_cur_attrs = a3;
}

void __29__OSLogTermDumper_startPager__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int v4;
  int v5;

  v5 = 0;
  fflush((FILE *)*MEMORY[0x1E0C80C20]);
  fflush((FILE *)*MEMORY[0x1E0C80C10]);
  if (close(1) == -1)
  {
    v2 = *__error();
    v3 = *__error();
    if (v2 == 9)
    {
      qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_1EE52EA88 = v3;
      __break(1u);
      goto LABEL_11;
    }
    _os_assumes_log();
  }
  if (close(2) != -1)
    goto LABEL_3;
  v4 = *__error();
  v3 = *__error();
  if (v4 == 9)
  {
LABEL_11:
    qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_1EE52EA88 = v3;
    __break(1u);
    return;
  }
  _os_assumes_log();
LABEL_3:
  if (waitpid(*(_DWORD *)(a1 + 32), &v5, 0) < 0)
    perror("waitpid");
}

@end
