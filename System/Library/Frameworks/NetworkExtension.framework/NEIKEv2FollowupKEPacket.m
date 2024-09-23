@implementation NEIKEv2FollowupKEPacket

- (void)gatherPayloads
{
  const char *v3;
  const char *v4;
  const char *v5;
  SEL v6;
  SEL v7;
  id newValue;

  newValue = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self)
  {
    if (objc_getProperty(self, v3, 88, 1))
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v4, 88, 1));
    if (objc_getProperty(self, v4, 96, 1))
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v5, 96, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v5, 64, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v6, 56, 1));
    objc_setProperty_atomic(self, v7, newValue, 80);
  }
  else
  {
    objc_msgSend(newValue, "addObjectsFromArray:", 0);
    objc_msgSend(newValue, "addObjectsFromArray:", 0);
  }

}

- (void)filloutPayloads
{
  NEIKEv2FollowupKEPacket *v2;
  NEIKEv2FollowupKEPacket *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  _QWORD *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  ptrdiff_t v18;
  NEIKEv2FollowupKEPacket *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  _QWORD *v26;
  _BYTE v27[128];
  uint64_t v28;

  v2 = self;
  v28 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  if (self)
    self = (NEIKEv2FollowupKEPacket *)objc_getProperty(self, a2, 80, 1);
  v3 = self;
  v4 = -[NEIKEv2FollowupKEPacket countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = v8;
            if (v2 && objc_getProperty(v2, v10, 64, 1))
            {
              objc_msgSend(objc_getProperty(v2, v12, 64, 1), "arrayByAddingObject:", v11);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_20;
            }
            v26 = v11;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1, (_QWORD)v21);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v2)
LABEL_20:
              objc_setProperty_atomic(v2, v13, v14, 64);

            if (v11 && v2 && v11[3] == 16441)
            {
              v18 = 96;
              v19 = v2;
              v20 = v11;
              goto LABEL_27;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_29;
            if (v2 && objc_getProperty(v2, v15, 56, 1))
            {
              objc_msgSend(objc_getProperty(v2, v16, 56, 1), "arrayByAddingObject:", v8);
              v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v25 = v8;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1, (_QWORD)v21);
              v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
              if (!v2)
                goto LABEL_28;
            }
            v19 = v2;
            v20 = v11;
            v18 = 56;
LABEL_27:
            objc_setProperty_atomic(v19, v17, v20, v18);
          }
LABEL_28:

          goto LABEL_29;
        }
        if (v2)
          objc_setProperty_atomic(v2, v9, v8, 88);
LABEL_29:
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NEIKEv2FollowupKEPacket countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_ke, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("IKE_FOLLOWUP_KE");
}

+ (unint64_t)exchangeType
{
  return 44;
}

@end
