@implementation _GCControllerDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)controllerClass
{
  return (Class)objc_opt_class();
}

- (_GCControllerDescription)initWithIdentifier:(id)a3 components:(id)a4
{
  id v6;
  id v7;
  _GCControllerDescription *v8;
  uint64_t v9;
  NSCopying *identifier;
  uint64_t v11;
  NSArray *componentDescriptions;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_GCControllerDescription;
  v8 = -[_GCControllerDescription init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copyWithZone:", 0);
    identifier = v8->_identifier;
    v8->_identifier = (NSCopying *)v9;

    v11 = objc_msgSend(v7, "copy");
    componentDescriptions = v8->_componentDescriptions;
    v8->_componentDescriptions = (NSArray *)v11;

  }
  return v8;
}

- (_GCControllerDescription)init
{
  -[_GCControllerDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (_GCControllerDescription)initWithCoder:(id)a3
{
  id v4;
  _GCControllerDescription *v5;
  void *v6;
  uint64_t v7;
  NSCopying *identifier;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *componentDescriptions;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_GCControllerDescription;
  v5 = -[_GCControllerDescription init](&v14, sel_init);
  if (v5)
  {
    GCIPCObjectIdentifier_Classes();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSCopying *)v7;

    _GCControllerComponentDescription_Classes();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setByAddingObject:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("components"));
    v11 = objc_claimAutoreleasedReturnValue();
    componentDescriptions = v5->_componentDescriptions;
    v5->_componentDescriptions = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *componentDescriptions;
  id v5;

  componentDescriptions = self->_componentDescriptions;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", componentDescriptions, CFSTR("components"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));

}

- (unint64_t)hash
{
  return -[NSCopying hash](self->_identifier, "hash");
}

- (BOOL)isEqualToDescription:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  if (-[NSCopying isEqual:](self->_identifier, "isEqual:", v4[1]))
    v5 = -[NSArray isEqualToArray:](self->_componentDescriptions, "isEqualToArray:", v4[2]);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[_GCControllerDescription isEqualToDescription:](self, "isEqualToDescription:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = -[NSCopying isEqual:](self->_identifier, "isEqual:", v4);
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (NSString)description
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ '%@'>"), v4, self->_identifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)redactedDescription
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ '#%llx'>"), v4, -[NSCopying hash](self->_identifier, "hash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ %p '%@'> %@"), v4, self, self->_identifier, self->_componentDescriptions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)materializeWithContext:(id)a3
{
  id v4;
  GCController *materializedController;
  NSCopying *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  GCController *v15;
  GCController *v16;
  GCController *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  materializedController = self->_materializedController;
  if (!materializedController)
  {
    v6 = self->_identifier;
    v7 = (void *)objc_msgSend(objc_alloc((Class)&off_254DEBB20), "initWithCapacity:", -[NSArray count](self->_componentDescriptions, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = self->_componentDescriptions;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "materializeWithContext:", v4, (_QWORD)v19);
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
          break;
        v14 = (void *)v13;
        objc_msgSend(v7, "addObject:", v13);

        if (v10 == ++v12)
        {
          v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v10)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      v15 = (GCController *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "controllerClass")), "initWithIdentifier:components:", v6, v7);
      v16 = self->_materializedController;
      self->_materializedController = v15;

      if (!self->_materializedController || !objc_msgSend(v4, "conformsToProtocol:", &unk_254DC0AB0))
        goto LABEL_14;
      objc_msgSend(v4, "IPCObjectRegistry");
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
      -[NSArray registerIPCObject:](v8, "registerIPCObject:", self->_materializedController);
    }

LABEL_14:
    materializedController = self->_materializedController;
  }
  v17 = materializedController;

  return v17;
}

- (BOOL)update:(id)a3 withContext:(id)a4
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  BOOL v37;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id obj;
  id v44;
  NSArray *v45;
  _GCControllerDescription *v46;
  uint64_t v47;
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
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v41 = a4;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = self;
  v9 = objc_msgSend(v8, "isEqual:", self->_identifier);

  if ((v9 & 1) == 0)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCController.m"), 983, &stru_24D2B85A8);

  }
  objc_msgSend(v7, "components", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v10, "mutableCopy");
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v11)
  {
    v12 = v11;
    v44 = *(id *)v57;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(id *)v57 != v44)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v16 = v46->_componentDescriptions;
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v53;
          while (2)
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v53 != v19)
                objc_enumerationMutation(v16);
              objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "identifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v15, "isEqual:", v21);

              if ((v22 & 1) != 0)
              {

                goto LABEL_18;
              }
            }
            v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
            if (v18)
              continue;
            break;
          }
        }

        objc_msgSend(v42, "removeObject:", v14);
LABEL_18:

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    }
    while (v12);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v45 = v46->_componentDescriptions;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  if (v23)
  {
    v24 = v23;
    v47 = *(_QWORD *)v49;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v49 != v47)
          objc_enumerationMutation(v45);
        v26 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v25);
        objc_msgSend(v26, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v42, "count"))
          goto LABEL_34;
        v28 = 0;
        while (1)
        {
          objc_msgSend(obj, "objectAtIndexedSubscript:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v27, "isEqual:", v30);

          if ((v31 & 1) != 0)
            break;

          if (++v28 >= (unint64_t)objc_msgSend(v42, "count"))
            goto LABEL_34;
        }
        if (!v29)
        {
LABEL_34:
          objc_msgSend(v26, "materializeWithContext:", v41);
          v32 = objc_claimAutoreleasedReturnValue();
          if (!v32)
            goto LABEL_44;
          v33 = (void *)v32;
          objc_msgSend(v42, "addObject:", v32);
          v29 = 0;
LABEL_36:

          goto LABEL_37;
        }
        if (!objc_msgSend(v26, "conformsToProtocol:", &unk_254DCBAE0))
        {
          objc_msgSend(v26, "materializeWithContext:", v41);
          v34 = objc_claimAutoreleasedReturnValue();
          if (!v34)
          {
LABEL_43:

LABEL_44:
            v37 = 0;
            v36 = v40;
            goto LABEL_45;
          }
          v33 = (void *)v34;
          objc_msgSend(v42, "replaceObjectAtIndex:withObject:", v28, v34);
          goto LABEL_36;
        }
        if ((objc_msgSend(v26, "update:withContext:", v29, v41) & 1) == 0)
          goto LABEL_43;
LABEL_37:

        ++v25;
      }
      while (v25 != v24);
      v35 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      v24 = v35;
    }
    while (v35);
  }

  v36 = v40;
  objc_msgSend(v40, "setComponents:", v42);
  v37 = 1;
LABEL_45:

  return v37;
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materializedController, 0);
  objc_storeStrong((id *)&self->_componentDescriptions, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
