@implementation DTActivityTapTableDecoder

- (DTActivityTapTableDecoder)init
{
  DTActivityTapTableDecoder *v2;
  uint64_t v3;
  NSMutableArray *memos;
  uint64_t v5;
  NSMutableData *stack;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  DTStateActionDecoder *value;
  uint64_t v11;
  DTStateActionDecoder *v12;
  uint64_t v13;
  uint64_t v14;
  XRIntKeyedDictionary *processesByPID;
  uint64_t v16;
  XRIntKeyedDictionary *threadsByTID;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)DTActivityTapTableDecoder;
  v2 = -[DTActivityTapTableDecoder init](&v19, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    memos = v2->_memos;
    v2->_memos = (NSMutableArray *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 0x400000);
    stack = v2->_stack;
    v2->_stack = (NSMutableData *)v5;

    v7 = operator new();
    v8 = -[NSMutableData mutableBytes](v2->_stack, "mutableBytes");
    v9 = -[NSMutableData length](v2->_stack, "length");
    *(_QWORD *)v7 = 0;
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_QWORD *)(v7 + 24) = v8;
    *(_QWORD *)(v7 + 32) = v9;
    *(_QWORD *)(v7 + 40) = v8 + v9;
    *(_QWORD *)(v7 + 48) = 0;
    *(_DWORD *)(v7 + 56) = 0;
    *(_DWORD *)(v7 + 80) = 0;
    *(_DWORD *)(v7 + 92) = 0;
    value = v2->_decoder.__ptr_.__value_;
    v2->_decoder.__ptr_.__value_ = (DTStateActionDecoder *)v7;
    if (value)
      MEMORY[0x227678FE4](value, 0x10F0C409877F7D9);
    v11 = operator new();
    v12 = v2->_decoder.__ptr_.__value_;
    *(_QWORD *)v11 = 0;
    *(_QWORD *)(v11 + 8) = 0;
    *(_QWORD *)(v11 + 16) = 0x100000001;
    *(_QWORD *)(v11 + 32) = 0;
    *(_QWORD *)(v11 + 40) = 0;
    *(_QWORD *)(v11 + 24) = 0;
    *(_BYTE *)(v11 + 48) = 0;
    *(_QWORD *)(v11 + 72) = v12;
    v13 = (uint64_t)v2->_tableRowDecoder.__ptr_.__value_;
    v2->_tableRowDecoder.__ptr_.__value_ = (DTTableRowDecoder *)v11;
    if (v13)
      sub_222B34AB8((uint64_t)&v2->_tableRowDecoder, v13);
    v14 = objc_opt_new();
    processesByPID = v2->_processesByPID;
    v2->_processesByPID = (XRIntKeyedDictionary *)v14;

    v16 = objc_opt_new();
    threadsByTID = v2->_threadsByTID;
    v2->_threadsByTID = (XRIntKeyedDictionary *)v16;

  }
  return v2;
}

- (void)addMemo:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[NSMutableArray addObject:](self->_memos, "addObject:", v4);

}

- (void)addData:(id)a3
{
  DTActivityTraceTapMemo *v4;
  id v5;

  v5 = a3;
  v4 = -[DTActivityTraceTapMemo initWithData:]([DTActivityTraceTapMemo alloc], "initWithData:", v5);
  -[DTActivityTapTableDecoder addMemo:](self, "addMemo:", v4);

}

- (BOOL)next
{
  BOOL result;
  DTActivityTraceTapMemo *v4;
  DTActivityTraceTapMemo *currentChunk;
  const void *v6;
  unint64_t v7;
  $A07F0689B0CA25558B389157FA1A2C4F *p_columns;
  int v9;
  DTTableRowDecoder *value;
  uint64_t v11;
  unsigned int v12;
  DTActivityTraceTapMemo *v13;
  DTActivityTraceTapMemo *v14;
  const void *v15;
  unint64_t v16;
  _WORD *p_p;
  char v19;
  DTTableRowDecoder *v20;
  uint64_t v21;
  __int16 v22;
  unsigned __int8 i;
  int v24;
  char v25;
  uint64_t v26;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int8 v38;
  void *__p;
  uint64_t v40;
  uint64_t v41;

  if (self->_failed)
    return 0;
  if (self->_currentChunk)
    goto LABEL_8;
  if (-[NSMutableArray count](self->_memos, "count"))
  {
    -[NSMutableArray firstObject](self->_memos, "firstObject");
    v4 = (DTActivityTraceTapMemo *)objc_claimAutoreleasedReturnValue();
    currentChunk = self->_currentChunk;
    self->_currentChunk = v4;

    -[NSMutableArray removeObjectAtIndex:](self->_memos, "removeObjectAtIndex:", 0);
    __p = 0;
    v6 = -[DTActivityTraceTapMemo getBufferWithLength:](self->_currentChunk, "getBufferWithLength:", &__p);
    v7 = (unint64_t)__p;
    if (!__p)
      return 0;
    *(_QWORD *)self->_decoder.__ptr_.__value_ = v6;
    *((_QWORD *)self->_decoder.__ptr_.__value_ + 2) = *(_QWORD *)self->_decoder.__ptr_.__value_
                                                    + (v7 & 0xFFFFFFFFFFFFFFFELL);
    *((_QWORD *)self->_decoder.__ptr_.__value_ + 1) = *(_QWORD *)self->_decoder.__ptr_.__value_;
    self->_outOfData = 0;
  }
  if (self->_currentChunk)
  {
LABEL_8:
    p_columns = &self->_columns;
    while (1)
    {
      sub_222B31BBC((uint64_t *)self->_tableRowDecoder.__ptr_.__value_);
      v9 = *((_DWORD *)self->_decoder.__ptr_.__value_ + 20);
      if (v9 != 1)
      {
        if (v9 == 4)
        {
          -[NSMutableArray firstObject](self->_memos, "firstObject");
          v13 = (DTActivityTraceTapMemo *)objc_claimAutoreleasedReturnValue();
          v14 = self->_currentChunk;
          self->_currentChunk = v13;

          if (!self->_currentChunk)
            goto LABEL_116;
          -[NSMutableArray removeObjectAtIndex:](self->_memos, "removeObjectAtIndex:", 0);
          __p = 0;
          v15 = -[DTActivityTraceTapMemo getBufferWithLength:](self->_currentChunk, "getBufferWithLength:", &__p);
          v16 = (unint64_t)__p;
          if (!__p)
            return 0;
          *(_QWORD *)self->_decoder.__ptr_.__value_ = v15;
          *((_QWORD *)self->_decoder.__ptr_.__value_ + 2) = *(_QWORD *)self->_decoder.__ptr_.__value_
                                                          + (v16 & 0xFFFFFFFFFFFFFFFELL);
          *((_QWORD *)self->_decoder.__ptr_.__value_ + 1) = *(_QWORD *)self->_decoder.__ptr_.__value_;
          self->_outOfData = 0;
        }
        else if ((v9 - 5) < 2)
        {
          result = 0;
          self->_failed = 1;
          return result;
        }
        goto LABEL_21;
      }
      value = self->_tableRowDecoder.__ptr_.__value_;
      v11 = *((_QWORD *)value + 9);
      if (*(_DWORD *)(v11 + 80) != 1)
        goto LABEL_21;
      v12 = *(unsigned __int16 *)(v11 + 88);
      if (v12 == 1)
        break;
      if (v12 == 2 && self->_osLogTableID == v12 >> 8)
        return 1;
LABEL_21:
      if (self->_failed)
        return 0;
    }
    __p = 0;
    v40 = 0;
    v41 = 0;
    if (!sub_222B31ED8((uint64_t)value, (uint64_t)&__p))
      goto LABEL_32;
    if (SHIBYTE(v41) < 0)
    {
      p_p = __p;
      if (v40 != 6)
      {
        operator delete(__p);
        goto LABEL_21;
      }
    }
    else
    {
      if (SHIBYTE(v41) != 6)
        goto LABEL_21;
      p_p = &__p;
    }
    if (*(_DWORD *)p_p != 1814917999 || p_p[2] != 26479)
    {
LABEL_32:
      v19 = 1;
      goto LABEL_33;
    }
    v20 = self->_tableRowDecoder.__ptr_.__value_;
    v21 = *((_QWORD *)v20 + 9);
    if (*(_DWORD *)(v21 + 80) == 1 && (v22 = *(_WORD *)(v21 + 88), v22 - 1 < 2))
    {
      self->_osLogTableID = HIBYTE(v22);
      *(_QWORD *)&p_columns->time = -1;
      *(_QWORD *)&self->_columns.thread = -1;
      v38 = 0;
      if (sub_222B32048((uint64_t)v20, &v38))
      {
        if (v38)
        {
          for (i = 0; v38 > i; ++i)
          {
            v35 = 0;
            v36 = 0;
            v37 = 0;
            v24 = sub_222B320C8((uint64_t)self->_tableRowDecoder.__ptr_.__value_, i, (uint64_t)&v35);
            v25 = v24;
            if (!v24)
            {
              self->_failed = 1;
              goto LABEL_108;
            }
            if (SHIBYTE(v37) < 0)
            {
              v26 = v36;
              if (v36 == 4 && *(_DWORD *)v35 == 1701669236)
              {
LABEL_77:
                p_columns->time = i;
                goto LABEL_108;
              }
              if (v36 == 8)
              {
                if (*(_QWORD *)v35 == 0x79726F6765746163)
                  goto LABEL_88;
                v26 = v36;
              }
              if (v26 == 9)
              {
                if (*(_QWORD *)v35 == 0x6574737973627573 && *((_BYTE *)v35 + 8) == 109)
                {
LABEL_89:
                  self->_columns.subsystem = i;
                  goto LABEL_108;
                }
                v26 = v36;
              }
              if (v26 == 17)
              {
                v28 = (uint64_t *)v35;
                goto LABEL_67;
              }
            }
            else
            {
              if (HIBYTE(v37) <= 8u)
              {
                if (HIBYTE(v37) == 4)
                {
                  if ((_DWORD)v35 == 1701669236)
                    goto LABEL_77;
                }
                else if (HIBYTE(v37) == 8 && v35 == (void *)0x79726F6765746163)
                {
LABEL_88:
                  self->_columns.category = i;
                  goto LABEL_108;
                }
                goto LABEL_82;
              }
              if (HIBYTE(v37) == 9)
              {
                if (v35 == (void *)0x6574737973627573 && v36 == 109)
                  goto LABEL_89;
              }
              else if (HIBYTE(v37) == 17)
              {
                v28 = (uint64_t *)&v35;
LABEL_67:
                v29 = *v28;
                v30 = v28[1];
                v31 = *((unsigned __int8 *)v28 + 16);
                if (v29 == 0x692D7265646E6573 && v30 == 0x7461702D6567616DLL && v31 == 104)
                {
                  self->_columns.senderImagePath = i;
                  goto LABEL_108;
                }
              }
            }
LABEL_82:
            if (sub_222B31FB8(&v35, "process-image-path"))
            {
              self->_columns.processImagePath = i;
            }
            else if (sub_222B31FB8(&v35, "sender-image-name"))
            {
              self->_columns.senderImageName = i;
            }
            else if (sub_222B31FB8(&v35, "sender-image-uuid"))
            {
              self->_columns.senderImageUUID = i;
            }
            else if (sub_222B31FB8(&v35, "sender-image-offset"))
            {
              self->_columns.senderImageOffset = i;
            }
            else if (sub_222B31FB8(&v35, "format-string"))
            {
              self->_columns.format = i;
            }
            else if (sub_222B31FB8(&v35, "message"))
            {
              self->_columns.message = i;
            }
            else if (sub_222B31FB8(&v35, "backtrace"))
            {
              self->_columns.backtrace = i;
            }
            else if (sub_222B31FB8(&v35, "process"))
            {
              self->_columns.process = i;
            }
            else if (sub_222B31FB8(&v35, "thread"))
            {
              self->_columns.thread = i;
            }
            else if (sub_222B31FB8(&v35, "message-type"))
            {
              self->_columns.messageType = i;
            }
            else if (sub_222B31FB8(&v35, "timezone-name"))
            {
              self->_columns.timezoneName = i;
            }
            else if (sub_222B31FB8(&v35, "unix-time-interval"))
            {
              self->_columns.unixTimeInterval = i;
            }
LABEL_108:
            if (SHIBYTE(v37) < 0)
              operator delete(v35);
            if ((v25 & 1) == 0)
              goto LABEL_115;
          }
        }
        v19 = 1;
      }
      else
      {
        self->_failed = 1;
LABEL_115:
        v19 = 0;
      }
    }
    else
    {
      v19 = 0;
      self->_failed = 1;
    }
LABEL_33:
    if (SHIBYTE(v41) < 0)
      operator delete(__p);
    if ((v19 & 1) == 0)
      return 0;
    goto LABEL_21;
  }
LABEL_116:
  result = 0;
  self->_outOfData = 1;
  return result;
}

- (unint64_t)time
{
  return sub_222B32200(self, self->_columns.time);
}

- (NSString)subsystem
{
  return (NSString *)sub_222B3228C(self, self->_columns.subsystem);
}

- (NSString)category
{
  return (NSString *)sub_222B3228C(self, self->_columns.category);
}

- (NSString)senderImagePath
{
  return (NSString *)sub_222B3228C(self, self->_columns.senderImagePath);
}

- (NSString)senderImageName
{
  return (NSString *)sub_222B3228C(self, self->_columns.senderImageName);
}

- (NSString)format
{
  return (NSString *)sub_222B3228C(self, self->_columns.format);
}

- (NSString)processImagePath
{
  return (NSString *)sub_222B3228C(self, self->_columns.processImagePath);
}

- (NSString)processName
{
  void *v2;
  void *v3;

  -[DTActivityTapTableDecoder processImagePath](self, "processImagePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (XRConstantEngineeringValue)process
{
  uint64_t v3;
  void *v4;
  __int128 v6;

  if (sub_222B323DC(self->_tableRowDecoder.__ptr_.__value_, self->_columns.process))
  {
    v3 = *((_QWORD *)self->_tableRowDecoder.__ptr_.__value_ + 9);
    v6 = *(_OWORD *)(v3 + 64);
    sub_222B32460(&v6, v3, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (XRConstantEngineeringValue *)v4;
}

- (XRConstantEngineeringValue)thread
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  uint64_t v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  if (!sub_222B323DC(self->_tableRowDecoder.__ptr_.__value_, self->_columns.thread))
    goto LABEL_12;
  v3 = (_QWORD *)*((_QWORD *)self->_tableRowDecoder.__ptr_.__value_ + 9);
  v4 = v3[9];
  if (*(_BYTE *)(v4 + 8) != 19)
    goto LABEL_12;
  v5 = v3[8];
  v6 = v5 + *(unsigned int *)(v4 + 4);
  if (*(_DWORD *)(v6 - 4) != 2)
    goto LABEL_12;
  v7 = (uint64_t *)(v3[3] + *(unsigned int *)(v6 - 28));
  v3[8] = v7;
  v3[9] = v6 - 28;
  v8 = *(unsigned int *)(v6 - 24);
  v9 = *v7;
  v25 = *v7;
  if (v8 <= 7)
  {
    memset((char *)&v26[-1] + v8, *(unsigned __int8 *)(v6 - 19), 8 - v8);
    v9 = v25;
  }
  -[XRIntKeyedDictionary objectForIntegerKey:](self->_threadsByTID, "objectForIntegerKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    if (*(_BYTE *)(v4 + 8) == 19)
    {
      v13 = v5 + *(unsigned int *)(v4 + 4);
      v16 = *(_DWORD *)(v13 - 4);
      v14 = v13 - 4;
      v15 = v16;
      if (v16 >= 2)
      {
        v17 = v14 - 12 * v15;
        v3[8] = v3[3] + *(unsigned int *)(v17 + 12);
        v3[9] = v17 + 12;
        v24 = *((_OWORD *)v3 + 4);
        sub_222B32460(&v24, (uint64_t)v3, self);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x24BE2A9A0];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v9);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "engineeringValueWithTypeID:value:", 7, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v26[0] = v21;
        v26[1] = v18;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE2A9A0], "engineeringValueWithTypeID:value:", 8, v22);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
    }
LABEL_12:
    v12 = 0;
    return (XRConstantEngineeringValue *)v12;
  }
  v12 = v10;
LABEL_8:

  return (XRConstantEngineeringValue *)v12;
}

- (unsigned)messageType
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  sub_222B3228C(self, self->_columns.messageType);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_25576FA50 != -1)
    dispatch_once(&qword_25576FA50, &unk_24EB27710);
  objc_msgSend((id)qword_25576FA58, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (XRConstantEngineeringValue)senderImageUUID
{
  uint64_t v3;
  void *v4;
  __int128 v6;

  if (sub_222B323DC(self->_tableRowDecoder.__ptr_.__value_, self->_columns.senderImageUUID))
  {
    v3 = *((_QWORD *)self->_tableRowDecoder.__ptr_.__value_ + 9);
    v6 = *(_OWORD *)(v3 + 64);
    sub_222B32A34(&v6, (_QWORD *)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (XRConstantEngineeringValue *)v4;
}

- (unint64_t)senderImageOffset
{
  return sub_222B32200(self, self->_columns.senderImageOffset);
}

- (NSTimeZone)timeZone
{
  void *v2;
  void *v3;

  sub_222B3228C(self, self->_columns.timezoneName);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSTimeZone *)v3;
}

- (double)unixTimeInterval
{
  __int16 unixTimeInterval;
  DTActivityTapTableDecoder *v3;
  double v4;
  DTStateActionDecoder *value;
  uint64_t v6;
  double *v7;
  uint64_t v8;
  double v9;
  double v11;

  unixTimeInterval = self->_columns.unixTimeInterval;
  v3 = self;
  v4 = 0.0;
  if (sub_222B323DC(v3->_tableRowDecoder.__ptr_.__value_, unixTimeInterval))
  {
    value = v3->_decoder.__ptr_.__value_;
    v7 = (double *)*((_QWORD *)value + 8);
    v6 = *((_QWORD *)value + 9);
    v8 = *(unsigned int *)(v6 + 4);
    v9 = *v7;
    v11 = v9;
    if (v8 > 7)
    {
      v4 = v9;
    }
    else
    {
      memset((char *)&v11 + v8, *(unsigned __int8 *)(v6 + 9), 8 - v8);
      v4 = v11;
    }
  }

  return v4;
}

- (XRConstantEngineeringValue)backtrace
{
  DTStateActionDecoder *value;
  void *v3;
  __int128 v5;

  value = self->_decoder.__ptr_.__value_;
  if (sub_222B323DC(self->_tableRowDecoder.__ptr_.__value_, self->_columns.backtrace))
  {
    v5 = *((_OWORD *)value + 4);
    sub_222B32DD4(&v5, value);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (XRConstantEngineeringValue *)v3;
}

- (XRConstantEngineeringValue)message
{
  __int16 message;
  DTActivityTapTableDecoder *v3;
  DTStateActionDecoder *value;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  int v17;
  unsigned int *v18;
  unsigned int *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  size_t *v35;
  void *v36;
  uint64_t v37;
  size_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  unsigned int v50;
  size_t *v51;
  uint64_t v52;
  double v53;
  double v54;
  void *v55;
  uint64_t v56;
  size_t v57;
  uint64_t v58;
  _QWORD *v59;
  char *v60;
  unsigned int *v61;
  unsigned __int16 v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  unsigned int *v66;
  _QWORD *v67;
  size_t v68;
  uint64_t v69;
  char *v70;
  BOOL v71;
  id v72;
  uint64_t v73;
  void *v74;
  void *v75;
  unsigned int *v77;
  size_t *v78;
  size_t v79;
  _BYTE *v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  char *buffer;
  const char **v86;
  __int128 v87;
  uint64_t __src;

  message = self->_columns.message;
  v3 = self;
  value = v3->_decoder.__ptr_.__value_;
  if (sub_222B323DC(v3->_tableRowDecoder.__ptr_.__value_, message)
    && (v5 = *((_QWORD *)value + 8),
        v86 = (const char **)((char *)value + 64),
        v6 = *((_QWORD *)value + 9),
        *(_BYTE *)(v6 + 8) == 19))
  {
    v7 = *(_DWORD *)(v5 + *(unsigned int *)(v6 + 4) - 4);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v7);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = 0;
      v9 = v5 - 4;
      buffer = v3->_buffer;
      do
      {
        if (*(_BYTE *)(v6 + 8) == 19)
        {
          v10 = (unsigned int *)(v9 + *(unsigned int *)(v6 + 4));
          v11 = *v10;
          if (v11 > (unsigned __int16)v8)
          {
            v12 = (unsigned __int16)v8 - v11;
            v13 = &v10[3 * v12];
            v14 = *((_QWORD *)value + 3);
            v15 = v14 + *v13;
            *((_QWORD *)value + 8) = v15;
            *((_QWORD *)value + 9) = v13;
            v17 = *((unsigned __int8 *)v13 + 8);
            v16 = v13 + 2;
            if (v17 == 19)
            {
              v18 = &v10[3 * v12];
              v20 = v18[1];
              v19 = v18 + 1;
              v21 = v15 + v20;
              v24 = *(_DWORD *)(v21 - 4);
              v22 = v21 - 4;
              v23 = v24;
              if (v24)
              {
                v25 = (unsigned int *)(v22 - 12 * v23);
                *((_QWORD *)value + 8) = v14 + *v25;
                *((_QWORD *)value + 9) = v25;
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sub_222B3495C(v86, buffer, 0x400uLL));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                if (v26)
                {
                  v83 = v26;
                  v27 = XREngineeringTypeIDForMnemonic();
                  v26 = v83;
                  if (*v16 == 19)
                  {
                    v28 = v15 + *v19;
                    v31 = *(_DWORD *)(v28 - 4);
                    v30 = v28 - 4;
                    v29 = v31;
                    if (v31 >= 2)
                    {
                      v32 = 1 - v29;
                      v33 = (char *)(v30 + 12 * (1 - v29));
                      v34 = *((_QWORD *)value + 3);
                      v35 = (size_t *)(v34 + *(unsigned int *)v33);
                      *((_QWORD *)value + 8) = v35;
                      *((_QWORD *)value + 9) = v33;
                      switch(*(_BYTE *)(MEMORY[0x24BE2A9E0] + v27))
                      {
                        case 0:
                        case 5:
                          goto LABEL_13;
                        case 1:
                          v37 = *(unsigned int *)(v30 + 12 * v32 + 4);
                          v38 = *v35;
                          *(_QWORD *)&v87 = *v35;
                          if (v37 <= 7)
                          {
                            memset((char *)&v87 + v37, *(unsigned __int8 *)(v30 + 12 * v32 + 9), 8 - v37);
                            v38 = v87;
                          }
                          v39 = (void *)MEMORY[0x24BE2A9A0];
                          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v38);
                          v40 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v39, "engineeringValueWithTypeID:value:", v27, v40);
                          v41 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v84, "addObject:", v41);
                          goto LABEL_31;
                        case 2:
                          v42 = *(unsigned int *)(v30 + 12 * v32 + 4);
                          v43 = *(unsigned int *)v35;
                          LODWORD(v87) = *(_DWORD *)v35;
                          if (v42 <= 3)
                          {
                            memset((char *)&v87 + v42, *(unsigned __int8 *)(v30 + 12 * v32 + 9), 4 - v42);
                            v43 = v87;
                          }
                          v44 = (void *)MEMORY[0x24BE2A9A0];
                          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v43);
                          v40 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v44, "engineeringValueWithTypeID:value:", v27, v40);
                          v41 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v84, "addObject:", v41);
                          goto LABEL_31;
                        case 3:
                          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sub_222B3495C(v86, buffer, 0x400uLL));
                          v45 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(MEMORY[0x24BE2A9A0], "engineeringValueWithTypeID:value:", v27, v45);
                          v46 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v84, "addObject:", v46);

                          goto LABEL_32;
                        case 4:
                          if ((_DWORD)v27 == 163)
                          {
                            v87 = *(_OWORD *)v86;
                            sub_222B32DD4(&v87, value);
                            v36 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v36)
                              objc_msgSend(v84, "addObject:", v36);
                            goto LABEL_14;
                          }
                          if ((_DWORD)v27 != 193)
                          {
LABEL_13:
                            objc_msgSend(MEMORY[0x24BE2A9A0], "engineeringValueWithTypeID:value:", v27, 0);
                            v36 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v84, "addObject:", v36);
LABEL_14:

                            goto LABEL_32;
                          }
                          v78 = v35;
                          v80 = (_BYTE *)(v30 + 12 * v32 + 8);
                          if (*v80 == 19)
                          {
                            v47 = (char *)v35 + *(unsigned int *)(v30 + 12 * v32 + 4);
                            v50 = *((_DWORD *)v47 - 1);
                            v48 = v47 - 4;
                            v49 = v50;
                            v51 = v35;
                            if (v50)
                            {
                              v33 = &v48[-12 * v49];
                              v51 = (size_t *)(v34 + *(unsigned int *)v33);
                              *((_QWORD *)value + 8) = v51;
                              *((_QWORD *)value + 9) = v33;
                            }
                          }
                          else
                          {
                            v51 = v35;
                          }
                          v56 = *((unsigned int *)v33 + 1);
                          v57 = *v51;
                          *(_QWORD *)&v87 = *v51;
                          if (v56 <= 7)
                          {
                            memset((char *)&v87 + v56, v33[9], 8 - v56);
                            v57 = v87;
                          }
                          if (v57 >> 22 > 0x18)
                          {
LABEL_54:
                            v72 = 0;
                          }
                          else
                          {
                            v81 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v57));
                            v58 = objc_msgSend(v81, "mutableBytes");
                            if (v57)
                            {
                              v59 = (_QWORD *)v58;
                              v60 = (char *)v78 - 4;
                              v61 = (unsigned int *)(v30 + 12 * v32 + 4);
                              v62 = 1;
                              v77 = v61;
                              while (1)
                              {
                                if (*v80 != 19
                                  || (v63 = &v60[*v61], v64 = *(unsigned int *)v63, v64 <= v62))
                                {

                                  goto LABEL_54;
                                }
                                v65 = v62 - v64;
                                v66 = (unsigned int *)&v63[12 * v65];
                                v67 = (_QWORD *)(*((_QWORD *)value + 3) + *v66);
                                *((_QWORD *)value + 8) = v67;
                                *((_QWORD *)value + 9) = v66;
                                v68 = v57 - 8;
                                if (v57 < 8)
                                  break;
                                v69 = *(unsigned int *)&v63[12 * v65 + 4];
                                *v59 = *v67;
                                if (v69 <= 7)
                                {
                                  v79 = v57;
                                  v70 = v60;
                                  memset((char *)v59 + v69, *(unsigned __int8 *)(*((_QWORD *)value + 9) + 9), 8 - v69);
                                  v60 = v70;
                                  v61 = v77;
                                  v57 = v79;
                                }
                                ++v62;
                                ++v59;
                                v71 = (uint64_t)v57 < 9;
                                v57 = v68;
                                if (v71)
                                  goto LABEL_58;
                              }
                              v73 = *(unsigned int *)&v63[12 * v65 + 4];
                              __src = *v67;
                              if (v73 <= 7)
                                memset((char *)&__src + v73, v63[12 * v65 + 9], 8 - v73);
                              memcpy(v59, &__src, v57);
                            }
LABEL_58:
                            v72 = v81;
                          }
                          v82 = v72;
                          objc_msgSend(MEMORY[0x24BE2A9A0], "engineeringValueWithTypeID:value:", 193);
                          v74 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v84, "addObject:", v74);

LABEL_32:
                          v26 = v83;
                          break;
                        case 6:
                          v52 = *(unsigned int *)(v30 + 12 * v32 + 4);
                          v53 = *(double *)v35;
                          *(_QWORD *)&v87 = *v35;
                          if (v52 > 7)
                          {
                            v54 = v53;
                          }
                          else
                          {
                            memset((char *)&v87 + v52, *(unsigned __int8 *)(v30 + 12 * v32 + 9), 8 - v52);
                            v54 = *(double *)&v87;
                          }
                          v55 = (void *)MEMORY[0x24BE2A9A0];
                          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v54);
                          v40 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v55, "engineeringValueWithTypeID:value:", v27, v40);
                          v41 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v84, "addObject:", v41);
LABEL_31:

                          goto LABEL_32;
                        default:
                          break;
                      }
                    }
                  }
                }

                v9 = v5 - 4;
              }
            }
          }
        }
        ++v8;
      }
      while (v8 != v7);
    }
    objc_msgSend(MEMORY[0x24BE2A9A0], "engineeringValueWithTypeID:value:", 46, v84);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v75 = 0;
  }

  return (XRConstantEngineeringValue *)v75;
}

- (BOOL)isOutOfData
{
  return self->_outOfData;
}

- (BOOL)hasFailed
{
  return self->_failed;
}

- (void).cxx_destruct
{
  DTStateActionDecoder *value;
  DTTableRowDecoder *v4;

  objc_storeStrong((id *)&self->_threadsByTID, 0);
  objc_storeStrong((id *)&self->_processesByPID, 0);
  value = self->_decoder.__ptr_.__value_;
  self->_decoder.__ptr_.__value_ = 0;
  if (value)
    MEMORY[0x227678FE4](value, 0x10F0C409877F7D9);
  v4 = self->_tableRowDecoder.__ptr_.__value_;
  self->_tableRowDecoder.__ptr_.__value_ = 0;
  if (v4)
    sub_222B34AB8((uint64_t)&self->_tableRowDecoder, (uint64_t)v4);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_currentChunk, 0);
  objc_storeStrong((id *)&self->_memos, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
