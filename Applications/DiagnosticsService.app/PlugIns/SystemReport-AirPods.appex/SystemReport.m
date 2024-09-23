@implementation SystemReport

- (void)setupWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  Class v13;
  uint64_t v14;
  Class v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  int v25;
  void *v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemReport componentIdentity](self, "componentIdentity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Component"), "stringByAppendingString:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemReport componentIdentity](self, "componentIdentity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SystemReport componentIdentity](self, "componentIdentity"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", v11));

    v7 = (void *)v12;
  }
  v13 = NSClassFromString((NSString *)v7);
  if (!v13)
  {
    v22 = DiagnosticLogHandleForCategory(6, v14);
    v21 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      goto LABEL_10;
    v25 = 138412290;
    v26 = v7;
    v23 = "Class named [%@] does not exist";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, v23, (uint8_t *)&v25, 0xCu);
    goto LABEL_10;
  }
  v15 = v13;
  if (!-[objc_class conformsToProtocol:](v13, "conformsToProtocol:", &OBJC_PROTOCOL___DKReporter))
  {
    v24 = DiagnosticLogHandleForCategory(6, v16);
    v21 = objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      goto LABEL_10;
    v25 = 138412290;
    v26 = v7;
    v23 = "Class named [%@] does not conform to protocol DKReporter";
    goto LABEL_12;
  }
  v17 = (void *)objc_opt_new(v15);
  -[SystemReport setComponent:](self, "setComponent:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SystemReport component](self, "component"));
  objc_msgSend(v18, "setupWithContext:", v4);

  v20 = DiagnosticLogHandleForCategory(6, v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412290;
    v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Running [%@]", (uint8_t *)&v25, 0xCu);
  }
LABEL_10:

}

- (BOOL)isPresent
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SystemReport component](self, "component"));
  v3 = objc_msgSend(v2, "isPresent");

  return v3;
}

- (void)populateAttributes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SystemReport component](self, "component"));
  objc_msgSend(v5, "populateAttributes:", v4);

}

- (DKReporter)component
{
  return self->_component;
}

- (void)setComponent:(id)a3
{
  objc_storeStrong((id *)&self->_component, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_component, 0);
}

@end
