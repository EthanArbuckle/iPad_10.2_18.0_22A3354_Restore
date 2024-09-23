@implementation APClientState

- (NSSet)lockedAppBundleIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)hiddenAppBundleIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (APClientState)init
{
  id v3;
  APClientState *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  v4 = -[APClientState initWithLockedAppBundleIdentifiers:hiddenAppBundleIdentifiers:effectivelyLockedBundleIdentifiers:](self, "initWithLockedAppBundleIdentifiers:hiddenAppBundleIdentifiers:effectivelyLockedBundleIdentifiers:", v3, v3, v3);

  return v4;
}

- (APClientState)initWithLockedAppBundleIdentifiers:(id)a3 hiddenAppBundleIdentifiers:(id)a4 effectivelyLockedBundleIdentifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  APClientState *v11;
  uint64_t v12;
  NSSet *lockedAppBundleIdentifiers;
  uint64_t v14;
  NSSet *hiddenAppBundleIdentifiers;
  uint64_t v16;
  NSSet *effectivelyLockedAppBundleIdentifiers;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)APClientState;
  v11 = -[APClientState init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    lockedAppBundleIdentifiers = v11->_lockedAppBundleIdentifiers;
    v11->_lockedAppBundleIdentifiers = (NSSet *)v12;

    v14 = objc_msgSend(v9, "copy");
    hiddenAppBundleIdentifiers = v11->_hiddenAppBundleIdentifiers;
    v11->_hiddenAppBundleIdentifiers = (NSSet *)v14;

    v16 = objc_msgSend(v10, "copy");
    effectivelyLockedAppBundleIdentifiers = v11->_effectivelyLockedAppBundleIdentifiers;
    v11->_effectivelyLockedAppBundleIdentifiers = (NSSet *)v16;

  }
  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<APClientState locked: %@ hidden: %@ effectivelyLocked: %@>"), self->_lockedAppBundleIdentifiers, self->_hiddenAppBundleIdentifiers, self->_effectivelyLockedAppBundleIdentifiers);
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSSet hash](self->_lockedAppBundleIdentifiers, "hash");
  v4 = -[NSSet hash](self->_hiddenAppBundleIdentifiers, "hash") ^ v3;
  return v4 ^ -[NSSet hash](self->_effectivelyLockedAppBundleIdentifiers, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = (id *)v4;
    if (objc_msgSend(v5[1], "isEqual:", self->_lockedAppBundleIdentifiers)
      && objc_msgSend(v5[2], "isEqual:", self->_hiddenAppBundleIdentifiers))
    {
      v6 = objc_msgSend(v5[3], "isEqual:", self->_effectivelyLockedAppBundleIdentifiers);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (APClientState)initWithCoder:(id)a3
{
  id v4;
  APClientState *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSSet *lockedAppBundleIdentifiers;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSSet *hiddenAppBundleIdentifiers;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSSet *effectivelyLockedAppBundleIdentifiers;
  NSSet *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  APClientState *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  id obj;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[3];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[APClientState init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("lockedAppBundleIdentifiers"));
    v9 = objc_claimAutoreleasedReturnValue();
    lockedAppBundleIdentifiers = v5->_lockedAppBundleIdentifiers;
    v5->_lockedAppBundleIdentifiers = (NSSet *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("hiddenAppBundleIdentifiers"));
    v14 = objc_claimAutoreleasedReturnValue();
    hiddenAppBundleIdentifiers = v5->_hiddenAppBundleIdentifiers;
    v5->_hiddenAppBundleIdentifiers = (NSSet *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("effectivelyLockedAppBundleIdentifiers"));
    v19 = objc_claimAutoreleasedReturnValue();
    effectivelyLockedAppBundleIdentifiers = v5->_effectivelyLockedAppBundleIdentifiers;
    v5->_effectivelyLockedAppBundleIdentifiers = (NSSet *)v19;

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v21 = v5->_hiddenAppBundleIdentifiers;
    v49[0] = v5->_lockedAppBundleIdentifiers;
    v49[1] = v21;
    v49[2] = v5->_effectivelyLockedAppBundleIdentifiers;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 3);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v42;
      v40 = (void *)*MEMORY[0x24BDD0B88];
      v37 = *(_QWORD *)v42;
      do
      {
        v25 = 0;
        v38 = v23;
        do
        {
          if (*(_QWORD *)v42 != v24)
            objc_enumerationMutation(obj);
          v26 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * v25);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = v5;
            v28 = v4;
            v29 = v26;
            v45 = 0u;
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v30 = v29;
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
            if (v31)
            {
              v32 = v31;
              v33 = *(_QWORD *)v46;
              while (2)
              {
                v34 = 0;
                do
                {
                  if (*(_QWORD *)v46 != v33)
                    objc_enumerationMutation(v30);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {

                    v4 = v28;
                    v5 = v27;
                    v24 = v37;
                    v23 = v38;
                    goto LABEL_19;
                  }
                  ++v34;
                }
                while (v32 != v34);
                v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
                if (v32)
                  continue;
                break;
              }
            }

            v4 = v28;
            v5 = v27;
            v24 = v37;
            v23 = v38;
          }
          else
          {

LABEL_19:
            _APMakeNSError(v40, 4864, (uint64_t)"-[APClientState initWithCoder:]", 86, 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "failWithError:", v35);

            v5 = 0;
          }
          ++v25;
        }
        while (v25 != v23);
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      }
      while (v23);
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *lockedAppBundleIdentifiers;
  id v5;

  lockedAppBundleIdentifiers = self->_lockedAppBundleIdentifiers;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", lockedAppBundleIdentifiers, CFSTR("lockedAppBundleIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hiddenAppBundleIdentifiers, CFSTR("hiddenAppBundleIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_effectivelyLockedAppBundleIdentifiers, CFSTR("effectivelyLockedAppBundleIdentifiers"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSSet)effectivelyLockedAppBundleIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectivelyLockedAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_hiddenAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_lockedAppBundleIdentifiers, 0);
}

@end
