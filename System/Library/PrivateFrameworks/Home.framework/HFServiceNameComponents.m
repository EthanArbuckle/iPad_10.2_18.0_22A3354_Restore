@implementation HFServiceNameComponents

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_rawRoomName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_rawServiceName, 0);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HFServiceNameComponents *v5;
  HFServiceNameComponents *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (HFServiceNameComponents *)a3;
  if (v5 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[HFServiceNameComponents serviceName](self, "serviceName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFServiceNameComponents serviceName](v6, "serviceName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HFServiceNameComponents serviceName](self, "serviceName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFServiceNameComponents serviceName](v6, "serviceName");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:", v3))
        {
          v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      -[HFServiceNameComponents roomName](self, "roomName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFServiceNameComponents roomName](v6, "roomName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[HFServiceNameComponents roomName](self, "roomName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFServiceNameComponents roomName](v6, "roomName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v13, "isEqual:", v14);

      }
      v9 = v16;
      if (v7 == v8)
        goto LABEL_14;
      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (NSString)composedString
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v18;

  -[HFServiceNameComponents serviceName](self, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceNameComponents serviceName](self, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[HFServiceNameComponents roomName](self, "roomName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      if (-[HFServiceNameComponents roomNameAtEndSeparatedByWhitespace](self, "roomNameAtEndSeparatedByWhitespace"))
      {
        -[HFServiceNameComponents serviceName](self, "serviceName");
        v7 = objc_claimAutoreleasedReturnValue();
        -[HFServiceNameComponents roomName](self, "roomName");
      }
      else
      {
        -[HFServiceNameComponents roomName](self, "roomName");
        v7 = objc_claimAutoreleasedReturnValue();
        -[HFServiceNameComponents serviceName](self, "serviceName");
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HFLocalizedStringWithFormat(CFSTR("HFServiceNameFormat"), CFSTR("%1$@ %2$@"), v11, v12, v13, v14, v15, v16, v7);
      v10 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v7;
      goto LABEL_10;
    }
  }
  else
  {

  }
  -[HFServiceNameComponents roomName](self, "roomName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    -[HFServiceNameComponents roomName](self, "roomName");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_10:

    v3 = (void *)v10;
  }
  return (NSString *)v3;
}

- (HFServiceNameComponents)initWithRawServiceName:(id)a3 rawRoomName:(id)a4
{
  id v6;
  id v7;
  HFServiceNameComponents *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  void *v41;
  objc_super v42;

  v6 = a3;
  v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)HFServiceNameComponents;
  v8 = -[HFServiceNameComponents init](&v42, sel_init);
  if (v8)
  {
    v9 = (void *)objc_msgSend(v6, "copy");
    -[HFServiceNameComponents setRawServiceName:](v8, "setRawServiceName:", v9);

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceNameComponents setServiceName:](v8, "setServiceName:", v11);

    v12 = (void *)objc_msgSend(v7, "copy");
    -[HFServiceNameComponents setRawRoomName:](v8, "setRawRoomName:", v12);

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceNameComponents setRoomName:](v8, "setRoomName:", v14);

    -[HFServiceNameComponents serviceName](v8, "serviceName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "length"))
    {
LABEL_18:

      goto LABEL_19;
    }
    -[HFServiceNameComponents roomName](v8, "roomName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v16, "length"))
    {
LABEL_17:

      goto LABEL_18;
    }
    -[HFServiceNameComponents serviceName](v8, "serviceName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceNameComponents roomName](v8, "roomName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToString:", v18);

    if ((v19 & 1) == 0)
    {
      -[HFServiceNameComponents serviceName](v8, "serviceName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFServiceNameComponents roomName](v8, "roomName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "rangeOfString:options:", v21, 129);
      v24 = v23;

      if (v24)
      {
        v25 = v22 + v24;
        -[HFServiceNameComponents serviceName](v8, "serviceName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "length");

        if (!v22)
        {
          -[HFServiceNameComponents serviceName](v8, "serviceName");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "substringFromIndex:", v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v29, "rangeOfCharacterFromSet:options:", v30, 0);

          if (v25 != v27)
          {
            -[HFServiceNameComponents setRoomNameAtEndSeparatedByWhitespace:](v8, "setRoomNameAtEndSeparatedByWhitespace:", 0);
            if (!v40)
            {
LABEL_16:
              -[HFServiceNameComponents serviceName](v8, "serviceName");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "stringByReplacingCharactersInRange:withString:", v22, v24, &stru_1EA741FF8);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[HFServiceNameComponents setServiceName:](v8, "setServiceName:", v37);

              -[HFServiceNameComponents serviceName](v8, "serviceName");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              -[HFServiceNameComponents setServiceName:](v8, "setServiceName:", v38);

              goto LABEL_17;
            }
LABEL_15:
            if (!-[HFServiceNameComponents roomNameAtEndSeparatedByWhitespace](v8, "roomNameAtEndSeparatedByWhitespace"))
            {
              -[HFServiceNameComponents setRoomName:](v8, "setRoomName:", 0);
              goto LABEL_19;
            }
            goto LABEL_16;
          }
          v28 = v40 == 0;
LABEL_11:
          -[HFServiceNameComponents serviceName](v8, "serviceName");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "substringToIndex:", v22);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v32, "rangeOfCharacterFromSet:options:", v33, 4);
          -[HFServiceNameComponents setRoomNameAtEndSeparatedByWhitespace:](v8, "setRoomNameAtEndSeparatedByWhitespace:", v34 + v35 == v22);

          if (v28)
            goto LABEL_16;
          goto LABEL_15;
        }
        if (v25 == v27)
        {
          v28 = 0;
          goto LABEL_11;
        }
        -[HFServiceNameComponents setRoomNameAtEndSeparatedByWhitespace:](v8, "setRoomNameAtEndSeparatedByWhitespace:", 0);
      }
    }
  }
LABEL_19:

  return v8;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (void)setRoomName:(id)a3
{
  objc_storeStrong((id *)&self->_roomName, a3);
}

- (void)setRawServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_rawServiceName, a3);
}

- (void)setRawRoomName:(id)a3
{
  objc_storeStrong((id *)&self->_rawRoomName, a3);
}

- (BOOL)roomNameAtEndSeparatedByWhitespace
{
  return self->_roomNameAtEndSeparatedByWhitespace;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HFServiceNameComponents serviceName](self, "serviceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)rawServiceName
{
  return self->_rawServiceName;
}

- (NSString)rawRoomName
{
  return self->_rawRoomName;
}

- (void)setRoomNameAtEndSeparatedByWhitespace:(BOOL)a3
{
  self->_roomNameAtEndSeparatedByWhitespace = a3;
}

@end
