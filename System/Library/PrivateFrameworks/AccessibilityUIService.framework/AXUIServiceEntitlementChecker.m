@implementation AXUIServiceEntitlementChecker

- (AXUIServiceEntitlementChecker)initWithServiceClass:(Class)a3
{
  AXUIServiceEntitlementChecker *v4;
  AXUIServiceEntitlementChecker *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXUIServiceEntitlementChecker;
  v4 = -[AXUIServiceEntitlementChecker init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[AXUIServiceEntitlementChecker setServiceClass:](v4, "setServiceClass:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[AXUIServiceEntitlementChecker setClientConnections:](self, "setClientConnections:", 0);
  -[AXUIServiceEntitlementChecker setEntitlementsCaches:](self, "setEntitlementsCaches:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AXUIServiceEntitlementChecker;
  -[AXUIServiceEntitlementChecker dealloc](&v3, sel_dealloc);
}

- (BOOL)serviceCanProcessMessageWithIdentifier:(unint64_t)a3 fromClientWithConnection:(id)a4 possibleRequiredEntitlements:(id *)a5 needsToRequireEntitlements:(BOOL *)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  BOOL *v37;
  void *v38;
  void *v39;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _OWORD v46[2];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  -[AXUIServiceEntitlementChecker clientConnections](self, "clientConnections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  -[AXUIServiceEntitlementChecker entitlementsCaches](self, "entitlementsCaches");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v11 != v13)
  {
    AXLogUI();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[AXUIServiceEntitlementChecker serviceCanProcessMessageWithIdentifier:fromClientWithConnection:possibleRequiredEntitlements:needsToRequireEntitlements:].cold.1((uint64_t)self, v14);

  }
  v15 = -[AXUIServiceEntitlementChecker _indexOfClientConnection:](self, "_indexOfClientConnection:", v9);
  -[AXUIServiceEntitlementChecker entitlementsCaches](self, "entitlementsCaches");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v9;
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = 0;
  }
  else
  {
    objc_msgSend(v16, "objectAtIndex:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = v20;
      LOBYTE(v22) = objc_msgSend(v20, "BOOLValue");
      v23 = a5;
      goto LABEL_36;
    }
  }
  v39 = v18;
  -[AXUIServiceEntitlementChecker _singleRequiredEntitlementForMessageWithIdentifier:](self, "_singleRequiredEntitlementForMessageWithIdentifier:", a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v24 = 0;
LABEL_12:
    memset(v46, 0, sizeof(v46));
    if (v9)
      objc_msgSend(v9, "auditToken");
    v38 = v16;
    if (v21)
    {
      LODWORD(v25) = -[AXUIServiceEntitlementChecker _clientProcessWithAuditToken:hasEntitlement:](self, "_clientProcessWithAuditToken:hasEntitlement:", v46, v21);
    }
    else
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v26 = v24;
      v25 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v25)
      {
        v37 = a6;
        v27 = *(_QWORD *)v43;
        while (2)
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v43 != v27)
              objc_enumerationMutation(v26);
            if (-[AXUIServiceEntitlementChecker _clientProcessWithAuditToken:hasEntitlement:](self, "_clientProcessWithAuditToken:hasEntitlement:", v46, *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i)))
            {
              LODWORD(v25) = 1;
              goto LABEL_26;
            }
          }
          v25 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
          if (v25)
            continue;
          break;
        }
LABEL_26:
        a6 = v37;
        v17 = a3;
      }

    }
    v23 = a5;
    v22 = (_DWORD)v25 != 0;

    v16 = v38;
    goto LABEL_29;
  }
  -[AXUIServiceEntitlementChecker _possibleRequiredEntitlementForMessageWithIdentifier:](self, "_possibleRequiredEntitlementForMessageWithIdentifier:", a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    goto LABEL_12;
  v22 = -[AXUIServiceEntitlementChecker _isSafeToProcessMessageFromUnentitledProcessWithIdentifier:](self, "_isSafeToProcessMessageFromUnentitledProcessWithIdentifier:", a3);
  v23 = a5;
LABEL_29:
  v18 = v39;
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[AXUIServiceEntitlementChecker clientConnections](self, "clientConnections");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      v29 = (void *)objc_opt_new();
      -[AXUIServiceEntitlementChecker setClientConnections:](self, "setClientConnections:", v29);
    }
    objc_msgSend(v29, "addObject:", v41);
    if (!v16)
    {
      v16 = (void *)objc_opt_new();
      -[AXUIServiceEntitlementChecker setEntitlementsCaches:](self, "setEntitlementsCaches:", v16);
    }
    v30 = objc_opt_new();

    objc_msgSend(v16, "addObject:", v30);
    v19 = (void *)v30;
    v18 = v39;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v22);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v31, v18);

LABEL_36:
  if (!v23)
  {
    if (!a6)
      goto LABEL_51;
    if ((v22 & 1) != 0)
    {
LABEL_42:
      *a6 = 0;
      goto LABEL_51;
    }
    goto LABEL_47;
  }
  if ((v22 & 1) != 0)
  {
    *v23 = 0;
    if (!a6)
      goto LABEL_51;
    goto LABEL_42;
  }
  -[AXUIServiceEntitlementChecker _singleRequiredEntitlementForMessageWithIdentifier:](self, "_singleRequiredEntitlementForMessageWithIdentifier:", v17);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v32, 0);
  else
    -[AXUIServiceEntitlementChecker _possibleRequiredEntitlementForMessageWithIdentifier:](self, "_possibleRequiredEntitlementForMessageWithIdentifier:", v17);
  v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *v23 = v33;

  if (a6)
  {
LABEL_47:
    -[AXUIServiceEntitlementChecker _singleRequiredEntitlementForMessageWithIdentifier:](self, "_singleRequiredEntitlementForMessageWithIdentifier:", v17);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      *a6 = 0;
    }
    else
    {
      -[AXUIServiceEntitlementChecker _possibleRequiredEntitlementForMessageWithIdentifier:](self, "_possibleRequiredEntitlementForMessageWithIdentifier:", v17);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *a6 = v35 == 0;

    }
  }
LABEL_51:

  return v22;
}

- (void)clientConnectionWillBeTerminated:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;

  v4 = -[AXUIServiceEntitlementChecker _indexOfClientConnection:](self, "_indexOfClientConnection:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    -[AXUIServiceEntitlementChecker clientConnections](self, "clientConnections");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectAtIndex:", v5);
    if (!objc_msgSend(v7, "count"))
      -[AXUIServiceEntitlementChecker setClientConnections:](self, "setClientConnections:", 0);
    -[AXUIServiceEntitlementChecker entitlementsCaches](self, "entitlementsCaches");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectAtIndex:", v5);
    if (!objc_msgSend(v6, "count"))
      -[AXUIServiceEntitlementChecker setEntitlementsCaches:](self, "setEntitlementsCaches:", 0);

  }
}

- (unint64_t)_indexOfClientConnection:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AXUIServiceEntitlementChecker clientConnections](self, "clientConnections");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "isEqual:", v4, (_QWORD)v14) & 1) != 0)
        {
          v12 = v8 + v10;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v12;
}

- (BOOL)_clientProcessWithAuditToken:(id *)a3 hasEntitlement:(id)a4
{
  uint64_t v4;
  void *v5;
  BOOL v6;

  objc_msgSend(objc_retainAutorelease(a4), "UTF8String");
  v4 = xpc_copy_entitlement_for_token();
  v5 = (void *)v4;
  v6 = v4 && MEMORY[0x2199F2920](v4) == MEMORY[0x24BDACF80] && xpc_BOOL_get_value(v5);

  return v6;
}

- (id)_singleRequiredEntitlementForMessageWithIdentifier:(unint64_t)a3
{
  objc_class *v4;
  void *v5;

  v4 = -[AXUIServiceEntitlementChecker serviceClass](self, "serviceClass");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class requiredEntitlementForProcessingMessageWithIdentifier:](v4, "requiredEntitlementForProcessingMessageWithIdentifier:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_possibleRequiredEntitlementForMessageWithIdentifier:(unint64_t)a3
{
  objc_class *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = -[AXUIServiceEntitlementChecker serviceClass](self, "serviceClass");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class possibleRequiredEntitlementsForProcessingMessageWithIdentifier:](v4, "possibleRequiredEntitlementsForProcessingMessageWithIdentifier:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && !objc_msgSend(v5, "count"))
    {
      AXLogUI();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[AXUIServiceEntitlementChecker _possibleRequiredEntitlementForMessageWithIdentifier:].cold.1(v7);

    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)_isSafeToProcessMessageFromUnentitledProcessWithIdentifier:(unint64_t)a3
{
  objc_class *v4;

  v4 = -[AXUIServiceEntitlementChecker serviceClass](self, "serviceClass");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[objc_class isSafeToProcessMessageFromUnentitledProcessWithIdentifier:](v4, "isSafeToProcessMessageFromUnentitledProcessWithIdentifier:", a3);
  else
    return 0;
}

- (Class)serviceClass
{
  return self->_serviceClass;
}

- (void)setServiceClass:(Class)a3
{
  self->_serviceClass = a3;
}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnections, a3);
}

- (NSMutableArray)entitlementsCaches
{
  return self->_entitlementsCaches;
}

- (void)setEntitlementsCaches:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementsCaches, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementsCaches, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
}

- (void)serviceCanProcessMessageWithIdentifier:(uint64_t)a1 fromClientWithConnection:(NSObject *)a2 possibleRequiredEntitlements:needsToRequireEntitlements:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_215E2A000, a2, OS_LOG_TYPE_FAULT, "The client connections array and the entitlements caches array are supposed to have the same number of elements (%@).", (uint8_t *)&v2, 0xCu);
}

- (void)_possibleRequiredEntitlementForMessageWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_215E2A000, log, OS_LOG_TYPE_FAULT, "Unexpectedly received an empty array from possibleRequiredEntitlementsForProcessingMessageWithIdentifier:. The array must have at least one object.", v1, 2u);
}

@end
