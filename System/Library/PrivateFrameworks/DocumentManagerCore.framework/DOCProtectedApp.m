@implementation DOCProtectedApp

- (DOCProtectedApp)initWith:(id)a3 oids:(id)a4
{
  id v6;
  id v7;
  DOCProtectedApp *v8;
  DOCProtectedApp *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DOCProtectedApp;
  v8 = -[DOCProtectedApp init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[DOCProtectedApp setAppContainerBundleID:](v8, "setAppContainerBundleID:", v6);
    v10 = (void *)objc_msgSend(v7, "copy");
    -[DOCProtectedApp setOids:](v9, "setOids:", v10);

  }
  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)DOCProtectedApp;
  -[DOCProtectedApp description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCProtectedApp appContainerBundleID](self, "appContainerBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCProtectedApp oids](self, "oids");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ appContainerBundleID=%@, oids=%@"), v4, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  DOCProtectedApp *v4;
  DOCProtectedApp *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (DOCProtectedApp *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  if (self == v4)
  {
    v11 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  -[DOCProtectedApp appContainerBundleID](self, "appContainerBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCProtectedApp appContainerBundleID](v5, "appContainerBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    -[DOCProtectedApp oids](self, "oids");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCProtectedApp oids](v5, "oids");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToSet:", v10);

  }
  else
  {
LABEL_6:
    v11 = 0;
  }
LABEL_8:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[DOCProtectedApp appContainerBundleID](self, "appContainerBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DOCProtectedApp oids](self, "oids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + v4;

  return v6;
}

- (NSString)appContainerBundleID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAppContainerBundleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSSet)oids
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOids:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oids, 0);
  objc_storeStrong((id *)&self->_appContainerBundleID, 0);
}

@end
