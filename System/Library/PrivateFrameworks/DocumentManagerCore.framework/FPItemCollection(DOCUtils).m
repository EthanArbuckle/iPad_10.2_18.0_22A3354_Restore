@implementation FPItemCollection(DOCUtils)

- (void)doc_startObserving
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v2 = docLogHandle;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = a1;
    _os_log_impl(&dword_2090A2000, v2, OS_LOG_TYPE_DEFAULT, "Start observing collection %@", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(a1, "doc_setIsObserving:", 1);
  objc_msgSend(a1, "startObserving");
  +[DOCFPItemCollectionManager sharedManager](DOCFPItemCollectionManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionDidStartObserving:", a1);

}

- (void)doc_setIsObserving:()DOCUtils
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &_isObservingIdentifier, v2, (void *)1);

}

- (uint64_t)doc_startObservationIfNeeded
{
  uint64_t result;

  result = objc_msgSend(a1, "doc_displaysSearchResults");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(a1, "doc_isObserving");
    if ((result & 1) == 0)
      return objc_msgSend(a1, "doc_startObserving");
  }
  return result;
}

- (uint64_t)doc_displaysSearchResults
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (uint64_t)doc_isObserving
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_getAssociatedObject(a1, &_isObservingIdentifier);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)doc_stopObserving
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v2 = docLogHandle;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = a1;
    _os_log_impl(&dword_2090A2000, v2, OS_LOG_TYPE_DEFAULT, "Stop observing collection %@", (uint8_t *)&v5, 0xCu);
  }
  +[DOCFPItemCollectionManager sharedManager](DOCFPItemCollectionManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionDidStopObserving:", a1);

  objc_msgSend(a1, "doc_setIsObserving:", 0);
  return objc_msgSend(a1, "stopObserving");
}

- (uint64_t)doc_restartObservation
{
  if (objc_msgSend(a1, "doc_isObserving"))
    objc_msgSend(a1, "doc_stopObserving");
  return objc_msgSend(a1, "doc_startObservationIfNeeded");
}

@end
