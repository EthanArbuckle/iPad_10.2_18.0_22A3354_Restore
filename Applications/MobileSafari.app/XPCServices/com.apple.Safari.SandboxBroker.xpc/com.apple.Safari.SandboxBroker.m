int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  SafariSandboxBrokerServiceDelegate *v4;
  void *v5;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_alloc_init(SafariSandboxBrokerServiceDelegate);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](NSXPCListener, "serviceListener"));
  objc_msgSend(v5, "setDelegate:", v4);
  objc_autoreleasePoolPop(v3);
  objc_msgSend(v5, "resume");
  exit(1);
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "auditToken");
}

id objc_msgSend_initWithPID_auditToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPID:auditToken:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceListener");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}
