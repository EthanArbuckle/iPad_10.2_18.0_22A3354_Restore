@implementation LSApplicationWorkspaceObserver

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LSApplicationWorkspaceObserver uuid](self, "uuid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

}

- (LSApplicationWorkspaceObserver)init
{
  LSApplicationWorkspaceObserver *v2;
  NSUUID *v3;
  NSUUID *uuid;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LSApplicationWorkspaceObserver;
  v2 = -[LSApplicationWorkspaceObserver init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    uuid = v2->_uuid;
    v2->_uuid = v3;

  }
  return v2;
}

- (LSApplicationWorkspaceObserver)initWithCoder:(id)a3
{
  id v4;
  LSApplicationWorkspaceObserver *v5;
  uint64_t v6;
  NSUUID *uuid;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSApplicationWorkspaceObserver;
  v5 = -[LSApplicationWorkspaceObserver init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

  }
  return v5;
}

- (void)applicationInstallsDidStart:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceObserver applicationInstallsDidStart:].cold.1();

}

- (void)applicationInstallsDidChange:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceObserver applicationInstallsDidChange:].cold.1();

}

- (void)applicationInstallsDidUpdateIcon:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceObserver applicationInstallsDidUpdateIcon:].cold.1();

}

- (void)applicationsDidInstall:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceObserver applicationsDidInstall:].cold.1();

}

- (void)applicationsWillInstall:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceObserver applicationsWillInstall:].cold.1();

}

- (void)applicationsWillUninstall:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceObserver applicationsWillUninstall:].cold.1();

}

- (void)applicationsDidFailToInstall:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceObserver applicationsDidFailToInstall:].cold.1();

}

- (void)applicationsDidFailToUninstall:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceObserver applicationsDidFailToUninstall:].cold.1();

}

- (void)applicationsDidUninstall:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceObserver applicationsDidUninstall:].cold.1();

}

- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;

  v5 = a3;
  v6 = a4;
  _LSInstallLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceObserver applicationInstallsArePrioritized:arePaused:].cold.2(v5);

  _LSInstallLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceObserver applicationInstallsArePrioritized:arePaused:].cold.1(v6);

}

- (void)applicationInstallsDidPause:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceObserver applicationInstallsDidPause:].cold.1();

}

- (void)applicationInstallsDidResume:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceObserver applicationInstallsDidResume:].cold.1();

}

- (void)applicationInstallsDidCancel:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceObserver applicationInstallsDidCancel:].cold.1();

}

- (void)applicationInstallsDidPrioritize:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceObserver applicationInstallsDidPrioritize:].cold.1();

}

- (void)applicationStateDidChange:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceObserver applicationStateDidChange:].cold.1();

}

- (void)applicationIconDidChange:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceObserver applicationIconDidChange:].cold.1();

}

- (void)networkUsageChanged:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceObserver networkUsageChanged:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)deviceManagementPolicyDidChange:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceObserver deviceManagementPolicyDidChange:].cold.1();

}

+ (BOOL)actuallyOverridesDMFObserverMethod
{
  objc_class *v3;
  IMP MethodImplementation;

  if ((id)objc_opt_class() == a1)
    return 0;
  v3 = (objc_class *)objc_opt_class();
  MethodImplementation = class_getMethodImplementation(v3, sel_deviceManagementPolicyDidChange_);
  return MethodImplementation != class_getMethodImplementation((Class)a1, sel_deviceManagementPolicyDidChange_);
}

- (void)applicationsDidChangePersonas:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceObserver applicationsDidChangePersonas:].cold.1();

}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)applicationInstallsDidStart:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LSApplicationWorkspaceObserver applicationInstallsDidStart %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)applicationInstallsDidChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LSApplicationWorkspaceObserver applicationInstallsDidChange %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)applicationInstallsDidUpdateIcon:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LSApplicationWorkspaceObserver applicationInstallsDidUpdateIcon %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)applicationsDidInstall:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LSApplicationWorkspaceObserver applicationsDidInstall %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)applicationsWillInstall:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LSApplicationWorkspaceObserver applicationsWillInstall %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)applicationsWillUninstall:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LSApplicationWorkspaceObserver applicationsWillUninstall %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)applicationsDidFailToInstall:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LSApplicationWorkspaceObserver applicationsDidFailToInstall %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)applicationsDidFailToUninstall:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LSApplicationWorkspaceObserver applicationsDidFailToUninstall %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)applicationsDidUninstall:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LSApplicationWorkspaceObserver applicationsDidUninstall %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)applicationInstallsArePrioritized:(void *)a1 arePaused:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_3_5(&dword_182882000, v1, v2, "Currently %d paused installs: %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_5_1();
}

- (void)applicationInstallsArePrioritized:(void *)a1 arePaused:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_3_5(&dword_182882000, v1, v2, "Currently %d prioritized installs: %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_5_1();
}

- (void)applicationInstallsDidPause:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LSApplicationWorkspaceObserver applicationInstallsDidPause %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)applicationInstallsDidResume:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LSApplicationWorkspaceObserver applicationInstallsDidResume %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)applicationInstallsDidCancel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LSApplicationWorkspaceObserver applicationInstallsDidCancel %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)applicationInstallsDidPrioritize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LSApplicationWorkspaceObserver applicationInstallsDidPrioritize %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)applicationStateDidChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LSApplicationWorkspaceObserver applicationStateDidChange %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)applicationIconDidChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LSApplicationWorkspaceObserver applicationIconDidChange %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)networkUsageChanged:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_182882000, a2, a3, "LSApplicationWorkspaceObserver networkUsageChanged to %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)deviceManagementPolicyDidChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LSApplicationWorkspaceObserver deviceManagementPolicyDidChange %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)applicationsDidChangePersonas:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LSApplicationWorkspaceObserver applicationsDidChangePersonas %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
