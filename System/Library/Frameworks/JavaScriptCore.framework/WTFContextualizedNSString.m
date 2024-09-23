@implementation WTFContextualizedNSString

- (WTFContextualizedNSString)initWithContext:(StringView)a3 contents:(StringView)a4
{
  uint64_t v4;
  void *m_characters;
  uint64_t v6;
  void *v7;
  WTFContextualizedNSString *result;
  objc_super v9;

  v4 = *(_QWORD *)&a4.m_length;
  m_characters = a4.m_characters;
  v6 = *(_QWORD *)&a3.m_length;
  v7 = a3.m_characters;
  v9.receiver = self;
  v9.super_class = (Class)WTFContextualizedNSString;
  result = -[WTFContextualizedNSString init](&v9, sel_init);
  if (result)
  {
    result->context.m_characters = v7;
    result->context.m_length = v6;
    result->context.m_is8Bit = BYTE4(v6);
    result->contents.m_characters = m_characters;
    result->contents.m_length = v4;
    result->contents.m_is8Bit = BYTE4(v4);
  }
  return result;
}

- (unint64_t)length
{
  return self->contents.m_length + self->context.m_length;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  StringView *p_context;
  unint64_t m_length;
  StringView *p_contents;
  unsigned int v6;
  unsigned int v7;

  p_context = &self->context;
  m_length = self->context.m_length;
  if (m_length <= a3)
  {
    p_contents = &self->contents;
    v6 = a3 - m_length;
    v7 = self->contents.m_length;
    if (self->contents.m_is8Bit)
    {
      if (v7 > v6)
      {
        LOWORD(self) = *((unsigned __int8 *)p_contents->m_characters + v6);
        return (unsigned __int16)self;
      }
    }
    else if (v7 > v6)
    {
      LOWORD(self) = *((_WORD *)p_contents->m_characters + v6);
      return (unsigned __int16)self;
    }
LABEL_12:
    __break(1u);
    return (unsigned __int16)self;
  }
  if (!self->context.m_is8Bit)
  {
    if (m_length > a3)
    {
      LOWORD(self) = *((_WORD *)p_context->m_characters + a3);
      return (unsigned __int16)self;
    }
    goto LABEL_12;
  }
  if (m_length <= a3)
    goto LABEL_12;
  LOWORD(self) = *((unsigned __int8 *)p_context->m_characters + a3);
  return (unsigned __int16)self;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  StringView *p_context;
  uint64_t m_length;
  unsigned int v7;
  uint64_t location_low;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  const char *m_characters;
  StringView *p_contents;
  uint64_t v14;
  unsigned int v15;
  unsigned int location;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  const char *v21;
  uint64_t v22;
  unsigned __int16 *v23;
  unsigned __int16 *v24;
  __int128 v25;
  unsigned __int16 *v26;
  int8x16_t v27;
  __int128 v28;
  __int128 v29;
  char *v30;
  char *v31;
  char *v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  unint64_t v36;
  unsigned __int16 *v37;
  const char *v38;
  unsigned __int16 v39;
  uint8x8_t *v40;
  uint16x8_t *v41;
  unint64_t v42;
  uint8x16_t v43;
  uint16x8_t v44;
  uint16x8_t v45;
  uint8x8_t *v46;
  uint16x8_t *v47;
  unint64_t v48;
  uint8x8_t v49;
  unsigned __int16 *v50;
  unsigned __int16 *v51;
  unsigned __int16 *v52;
  __int128 v53;
  int8x16_t v54;
  __int128 v55;
  __int128 v56;
  char *v57;
  char *v58;
  char *v59;
  unint64_t v60;
  unsigned __int16 *v61;
  const char *v62;
  unsigned __int16 v63;
  uint64_t v64;
  unint64_t v65;
  uint8x8_t *v66;
  uint16x8_t *v67;
  unint64_t v68;
  uint8x16_t v69;
  uint16x8_t v70;
  uint16x8_t v71;
  uint8x8_t *v72;
  uint16x8_t *v73;
  unint64_t v74;
  uint8x8_t v75;
  int8x16x2_t v76;
  int8x16x2_t v77;
  int8x16x2_t v78;
  int8x16x2_t v79;
  int8x16x2_t v80;
  int8x16x2_t v81;

  p_context = &self->context;
  m_length = self->context.m_length;
  v7 = LODWORD(a4.location) + LODWORD(a4.length);
  if (m_length >= LODWORD(a4.location))
    location_low = LODWORD(a4.location);
  else
    location_low = m_length;
  if (m_length <= LODWORD(a4.location))
  {
    v11 = 0x100000000;
    m_characters = "";
    p_contents = &self->contents;
    v14 = self->contents.m_length;
    v15 = v14 + m_length;
    if (__CFADD__((_DWORD)v14, (_DWORD)m_length))
      goto LABEL_102;
  }
  else
  {
    if (m_length >= v7)
      v9 = LODWORD(a4.location) + LODWORD(a4.length);
    else
      v9 = self->context.m_length;
    v10 = v9 - location_low;
    if ((int)m_length - (int)location_low > v10 || (v10 = m_length - location_low, (_DWORD)location_low))
    {
      v11 = v10;
      if (self->context.m_is8Bit)
      {
        if (m_length - location_low < (unint64_t)v10)
          goto LABEL_102;
        m_characters = (char *)p_context->m_characters + location_low;
        v11 = v10 | 0x100000000;
        p_contents = &self->contents;
        v14 = self->contents.m_length;
        v15 = v14 + m_length;
        if (__CFADD__((_DWORD)v14, (_DWORD)m_length))
          goto LABEL_102;
      }
      else
      {
        if (m_length - location_low < (unint64_t)v10)
          goto LABEL_102;
        m_characters = (char *)p_context->m_characters + 2 * location_low;
        p_contents = &self->contents;
        v14 = self->contents.m_length;
        v15 = v14 + m_length;
        if (__CFADD__((_DWORD)v14, (_DWORD)m_length))
          goto LABEL_102;
      }
    }
    else
    {
      m_characters = (const char *)p_context->m_characters;
      v11 = *(_QWORD *)&self->context.m_length;
      p_contents = &self->contents;
      v14 = self->contents.m_length;
      v15 = v14 + m_length;
      if (__CFADD__((_DWORD)v14, (_DWORD)m_length))
        goto LABEL_102;
    }
  }
  if (v15 >= LODWORD(a4.location))
    location = a4.location;
  else
    location = v15;
  if (m_length <= LODWORD(a4.location))
    v17 = location;
  else
    v17 = self->context.m_length;
  v18 = v17 - m_length;
  if (v14 > v18)
  {
    if (v15 >= v7)
      v15 = LODWORD(a4.location) + LODWORD(a4.length);
    if (m_length <= v7)
      v19 = v15;
    else
      v19 = self->context.m_length;
    v20 = v19 - v17;
    if ((int)v14 - (int)v18 <= v20)
    {
      v20 = v14 - v18;
      if (v17 == (_DWORD)m_length)
      {
        v21 = (const char *)p_contents->m_characters;
        v22 = *(_QWORD *)&p_contents->m_length;
        if ((v11 & 0xFF00000000) == 0)
          goto LABEL_63;
LABEL_44:
        v23 = &a3[v11];
        if (v11 < 0x40)
        {
          v24 = a3;
          if (a3 == v23)
            goto LABEL_74;
        }
        else
        {
          v24 = &a3[v11 & 0xFFFFFFC0];
          v25 = 0uLL;
          v26 = a3;
          do
          {
            v76.val[0] = *(int8x16_t *)m_characters;
            v27 = *((int8x16_t *)m_characters + 1);
            v78.val[0] = (int8x16_t)*((_OWORD *)m_characters + 2);
            v28 = *((_OWORD *)m_characters + 3);
            m_characters += 64;
            v29 = v28;
            v78.val[1] = 0uLL;
            v80.val[0] = v27;
            v76.val[1] = 0uLL;
            v30 = (char *)v26;
            vst2q_s8(v30, v76);
            v30 += 32;
            v80.val[1] = 0uLL;
            vst2q_s8(v30, v80);
            v31 = (char *)(v26 + 32);
            vst2q_s8(v31, v78);
            v32 = (char *)(v26 + 48);
            vst2q_s8(v32, *(int8x16x2_t *)(&v25 - 1));
            v26 += 64;
          }
          while (v26 != v24);
          if (v24 == v23)
            goto LABEL_74;
        }
        v33 = (char *)&a3[v11] - (char *)v24 - 2;
        if (v33 < 0xE
          || (v24 < (unsigned __int16 *)&m_characters[(v33 >> 1) + 1]
            ? (v34 = m_characters >= (const char *)v24 + (v33 & 0xFFFFFFFFFFFFFFFELL) + 2)
            : (v34 = 1),
              !v34))
        {
          v37 = v24;
          v38 = m_characters;
          goto LABEL_59;
        }
        v35 = (v33 >> 1) + 1;
        if (v33 >= 0x3E)
        {
          v36 = v35 & 0xFFFFFFFFFFFFFFE0;
          v40 = (uint8x8_t *)(m_characters + 16);
          v41 = (uint16x8_t *)(v24 + 16);
          v42 = v35 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            v43 = *(uint8x16_t *)v40[-2].i8;
            v44 = vmovl_u8(*v40);
            v45 = vmovl_high_u8(*(uint8x16_t *)v40->i8);
            v41[-2] = vmovl_u8(*(uint8x8_t *)v43.i8);
            v41[-1] = vmovl_high_u8(v43);
            *v41 = v44;
            v41[1] = v45;
            v41 += 4;
            v40 += 4;
            v42 -= 32;
          }
          while (v42);
          if (v35 == v36)
            goto LABEL_74;
          if ((v35 & 0x18) == 0)
          {
            v38 = &m_characters[v36];
            v37 = &v24[v36];
            goto LABEL_59;
          }
        }
        else
        {
          v36 = 0;
        }
        v37 = &v24[v35 & 0xFFFFFFFFFFFFFFF8];
        v38 = &m_characters[v35 & 0xFFFFFFFFFFFFFFF8];
        v46 = (uint8x8_t *)&m_characters[v36];
        v47 = (uint16x8_t *)&v24[v36];
        v48 = v36 - (v35 & 0xFFFFFFFFFFFFFFF8);
        do
        {
          v49 = *v46++;
          *v47++ = vmovl_u8(v49);
          v48 += 8;
        }
        while (v48);
        if (v35 == (v35 & 0xFFFFFFFFFFFFFFF8))
          goto LABEL_74;
        do
        {
LABEL_59:
          v39 = *(unsigned __int8 *)v38++;
          *v37++ = v39;
        }
        while (v37 != v23);
        goto LABEL_74;
      }
    }
    v22 = v20;
    if (p_contents->m_is8Bit)
    {
      if (v14 - v18 >= (unint64_t)v20)
      {
        v21 = (char *)p_contents->m_characters + v18;
        v22 = v20 | 0x100000000;
        if ((v11 & 0xFF00000000) == 0)
          goto LABEL_63;
        goto LABEL_44;
      }
    }
    else if (v14 - v18 >= (unint64_t)v20)
    {
      v21 = (char *)p_contents->m_characters + 2 * v18;
      if ((v11 & 0xFF00000000) == 0)
        goto LABEL_63;
      goto LABEL_44;
    }
LABEL_102:
    __break(1u);
    return;
  }
  v22 = 0x100000000;
  v21 = "";
  if ((v11 & 0xFF00000000) != 0)
    goto LABEL_44;
LABEL_63:
  if ((_DWORD)v11)
  {
    if ((_DWORD)v11 == 1)
      *a3 = *(_WORD *)m_characters;
    else
      memcpy(a3, m_characters, 2 * v11);
  }
LABEL_74:
  v50 = &a3[v11];
  if ((v22 & 0xFF00000000) != 0)
  {
    v51 = &v50[v22];
    if (v22 >= 0x40)
    {
      v52 = &v50[v22 & 0xFFFFFFC0];
      v53 = 0uLL;
      do
      {
        v77.val[0] = *(int8x16_t *)v21;
        v54 = *((int8x16_t *)v21 + 1);
        v79.val[0] = (int8x16_t)*((_OWORD *)v21 + 2);
        v55 = *((_OWORD *)v21 + 3);
        v21 += 64;
        v56 = v55;
        v79.val[1] = 0uLL;
        v81.val[0] = v54;
        v77.val[1] = 0uLL;
        v57 = (char *)v50;
        vst2q_s8(v57, v77);
        v57 += 32;
        v81.val[1] = 0uLL;
        vst2q_s8(v57, v81);
        v58 = (char *)(v50 + 32);
        vst2q_s8(v58, v79);
        v59 = (char *)(v50 + 48);
        vst2q_s8(v59, *(int8x16x2_t *)(&v53 - 1));
        v50 += 64;
      }
      while (v50 != v52);
      v50 = v52;
    }
    if (v50 != v51)
    {
      v60 = (char *)&a3[v11 + (unint64_t)v22] - (char *)v50 - 2;
      if (v60 < 0xE
        || v50 < (unsigned __int16 *)&v21[(v60 >> 1) + 1] && v21 < (const char *)v50 + (v60 & 0xFFFFFFFFFFFFFFFELL) + 2)
      {
        v61 = v50;
        v62 = v21;
        goto LABEL_84;
      }
      v64 = (v60 >> 1) + 1;
      if (v60 >= 0x3E)
      {
        v65 = v64 & 0xFFFFFFFFFFFFFFE0;
        v66 = (uint8x8_t *)(v21 + 16);
        v67 = (uint16x8_t *)(v50 + 16);
        v68 = v64 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v69 = *(uint8x16_t *)v66[-2].i8;
          v70 = vmovl_u8(*v66);
          v71 = vmovl_high_u8(*(uint8x16_t *)v66->i8);
          v67[-2] = vmovl_u8(*(uint8x8_t *)v69.i8);
          v67[-1] = vmovl_high_u8(v69);
          *v67 = v70;
          v67[1] = v71;
          v67 += 4;
          v66 += 4;
          v68 -= 32;
        }
        while (v68);
        if (v64 == v65)
          return;
        if ((v64 & 0x18) == 0)
        {
          v62 = &v21[v65];
          v61 = &v50[v65];
          do
          {
LABEL_84:
            v63 = *(unsigned __int8 *)v62++;
            *v61++ = v63;
          }
          while (v61 != v51);
          return;
        }
      }
      else
      {
        v65 = 0;
      }
      v61 = &v50[v64 & 0xFFFFFFFFFFFFFFF8];
      v62 = &v21[v64 & 0xFFFFFFFFFFFFFFF8];
      v72 = (uint8x8_t *)&v21[v65];
      v73 = (uint16x8_t *)&v50[v65];
      v74 = v65 - (v64 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        v75 = *v72++;
        *v73++ = vmovl_u8(v75);
        v74 += 8;
      }
      while (v74);
      if (v64 != (v64 & 0xFFFFFFFFFFFFFFF8))
        goto LABEL_84;
    }
  }
  else if ((_DWORD)v22)
  {
    if ((_DWORD)v22 == 1)
      *v50 = *(_WORD *)v21;
    else
      memcpy(v50, v21, 2 * v22);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_DWORD *)self + 4) = 0;
  *((_BYTE *)self + 20) = 1;
  *((_QWORD *)self + 3) = 0;
  *((_DWORD *)self + 8) = 0;
  *((_BYTE *)self + 36) = 1;
  return self;
}

@end
