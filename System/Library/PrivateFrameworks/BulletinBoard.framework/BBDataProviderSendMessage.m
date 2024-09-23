@implementation BBDataProviderSendMessage

void __BBDataProviderSendMessage_block_invoke(_QWORD *a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x212B94804]();
  objc_msgSend((id)__server, "sendMessageToDataProviderSectionID:name:userInfo:", a1[4], a1[5], a1[6]);
  objc_autoreleasePoolPop(v2);
}

@end
