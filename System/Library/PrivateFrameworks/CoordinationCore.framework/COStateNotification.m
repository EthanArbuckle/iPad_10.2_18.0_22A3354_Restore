@implementation COStateNotification

- (COStateNotification)initWithState:(id)a3
{
  id v5;
  COStateNotification *v6;
  COStateNotification *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COStateNotification;
  v6 = -[COMeshCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_state, a3);

  return v7;
}

- (COStateNotification)initWithCoder:(id)a3
{
  id v4;
  COStateNotification *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *state;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)COStateNotification;
  v5 = -[COMeshCommand initWithCoder:](&v38, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("state"));
    v11 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSDictionary *)v11;

    if (v5->_state)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        -[NSDictionary allKeys](v5->_state, "allKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v35;
          v28 = v13;
          v29 = v10;
          v26 = *(_QWORD *)v35;
          while (2)
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v35 != v16)
                objc_enumerationMutation(v13);
              v27 = v17;
              v18 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v17);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_25;
              -[NSDictionary objectForKeyedSubscript:](v5->_state, "objectForKeyedSubscript:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
LABEL_24:

LABEL_25:
                goto LABEL_26;
              }
              v32 = 0u;
              v33 = 0u;
              v30 = 0u;
              v31 = 0u;
              v20 = v19;
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
              if (v21)
              {
                v22 = v21;
                v23 = *(_QWORD *)v31;
                while (2)
                {
                  for (i = 0; i != v22; ++i)
                  {
                    if (*(_QWORD *)v31 != v23)
                      objc_enumerationMutation(v20);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {

                      v13 = v28;
                      v10 = v29;
                      goto LABEL_24;
                    }
                  }
                  v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
                  if (v22)
                    continue;
                  break;
                }
              }

              v17 = v27 + 1;
              v13 = v28;
              v10 = v29;
              v16 = v26;
            }
            while (v27 + 1 != v15);
            v15 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
            if (v15)
              continue;
            break;
          }
        }
      }
      else
      {
        v13 = v5;
LABEL_26:
        v5 = 0;
      }

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COStateNotification;
  v4 = a3;
  -[COMeshCommand encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[COStateNotification state](self, "state", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("state"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
}

@end
