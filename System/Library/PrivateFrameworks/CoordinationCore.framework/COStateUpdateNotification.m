@implementation COStateUpdateNotification

- (COStateUpdateNotification)initWithUpdates:(id)a3 removals:(id)a4
{
  id v7;
  id v8;
  COStateUpdateNotification *v9;
  COStateUpdateNotification *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)COStateUpdateNotification;
  v9 = -[COMeshCommand init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_updates, a3);
    objc_storeStrong((id *)&v10->_removals, a4);
  }

  return v10;
}

- (COStateUpdateNotification)initWithCoder:(id)a3
{
  id v4;
  COStateUpdateNotification *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *updates;
  uint64_t v14;
  NSDictionary *removals;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  objc_super v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)COStateUpdateNotification;
  v5 = -[COMeshCommand initWithCoder:](&v59, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("updates"));
    v12 = objc_claimAutoreleasedReturnValue();
    updates = v5->_updates;
    v5->_updates = (NSDictionary *)v12;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("removals"));
    v14 = objc_claimAutoreleasedReturnValue();
    removals = v5->_removals;
    v5->_removals = (NSDictionary *)v14;

    if (v5->_updates)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_42;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      -[NSDictionary allKeys](v5->_updates, "allKeys");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v56;
        v41 = v16;
        v42 = v11;
        v36 = *(_QWORD *)v56;
LABEL_6:
        v19 = 0;
        v37 = v17;
        while (1)
        {
          if (*(_QWORD *)v56 != v18)
            objc_enumerationMutation(v16);
          v39 = v19;
          v20 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v19);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          -[NSDictionary objectForKeyedSubscript:](v5->_updates, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_44:

            break;
          }
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          objc_msgSend(v21, "allKeys");
          v22 = (id)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v52;
            while (2)
            {
              for (i = 0; i != v24; ++i)
              {
                if (*(_QWORD *)v52 != v25)
                  objc_enumerationMutation(v22);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
LABEL_43:

                  v16 = v41;
                  v11 = v42;
                  goto LABEL_44;
                }
              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
              if (v24)
                continue;
              break;
            }
          }

          v19 = v39 + 1;
          v16 = v41;
          v11 = v42;
          v18 = v36;
          if (v39 + 1 == v37)
          {
            v17 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
            if (v17)
              goto LABEL_6;
            goto LABEL_21;
          }
        }
LABEL_45:

        goto LABEL_46;
      }
LABEL_21:

    }
    if (!v5->_removals)
    {
LABEL_48:

      goto LABEL_49;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      -[NSDictionary allKeys](v5->_removals, "allKeys");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
      if (!v27)
      {
LABEL_47:

        goto LABEL_48;
      }
      v28 = *(_QWORD *)v48;
      v41 = v16;
      v42 = v11;
      v38 = *(_QWORD *)v48;
LABEL_26:
      v29 = 0;
      v40 = v27;
      while (1)
      {
        if (*(_QWORD *)v48 != v28)
          objc_enumerationMutation(v16);
        v30 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v29);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_45;
        -[NSDictionary objectForKeyedSubscript:](v5->_removals, "objectForKeyedSubscript:", v30);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_44;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v22 = v21;
        v31 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v44;
LABEL_33:
          v34 = 0;
          while (1)
          {
            if (*(_QWORD *)v44 != v33)
              objc_enumerationMutation(v22);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_43;
            if (v32 == ++v34)
            {
              v32 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
              if (v32)
                goto LABEL_33;
              break;
            }
          }
        }

        ++v29;
        v16 = v41;
        v11 = v42;
        v28 = v38;
        if (v29 == v40)
        {
          v27 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
          if (v27)
            goto LABEL_26;
          goto LABEL_47;
        }
      }
    }
LABEL_42:
    v16 = v5;
LABEL_46:
    v5 = 0;
    goto LABEL_47;
  }
LABEL_49:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)COStateUpdateNotification;
  v4 = a3;
  -[COMeshCommand encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[COStateUpdateNotification updates](self, "updates", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("updates"));

  -[COStateUpdateNotification removals](self, "removals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("removals"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)updates
{
  return self->_updates;
}

- (NSDictionary)removals
{
  return self->_removals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removals, 0);
  objc_storeStrong((id *)&self->_updates, 0);
}

@end
