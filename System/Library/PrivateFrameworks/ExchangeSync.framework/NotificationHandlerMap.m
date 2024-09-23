@implementation NotificationHandlerMap

void ___NotificationHandlerMap_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithStrongToStrongObjects");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_NotificationHandlerMap_sNotificationHandlerMap;
  _NotificationHandlerMap_sNotificationHandlerMap = v0;

}

@end
