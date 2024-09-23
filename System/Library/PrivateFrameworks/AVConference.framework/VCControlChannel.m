@implementation VCControlChannel

- (VCControlChannel)init
{
  VCControlChannel *v2;
  NSObject *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCControlChannel;
  v2 = -[VCObject init](&v5, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INITIATED, 0);
    v2->_asyncProcessingQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVConference.VCControlChannel.AsyncProcessingQueue", v3);
    v2->_reliableMessageResendInterval = 9;
    v2->_optionalTopics = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v2;
}

- (void)setMessageReceivedDelegate:(id)a3
{
  objc_storeWeak(&self->_messageReceivedDelegate, a3);
}

- (id)messageReceivedDelegate
{
  return objc_loadWeak(&self->_messageReceivedDelegate);
}

- (void)setDataReceivedDelegate:(id)a3
{
  objc_storeWeak(&self->_dataReceivedDelegate, a3);
}

- (id)dataReceivedDelegate
{
  return objc_loadWeak(&self->_dataReceivedDelegate);
}

- (void)dealloc
{
  NSObject *asyncProcessingQueue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];

  objc_storeWeak(&self->_messageReceivedDelegate, 0);
  objc_storeWeak(&self->_dataReceivedDelegate, 0);
  asyncProcessingQueue = self->_asyncProcessingQueue;
  if (asyncProcessingQueue)
    dispatch_release(asyncProcessingQueue);
  v4.receiver = self;
  v4.super_class = (Class)VCControlChannel;
  -[VCObject dealloc](&v4, sel_dealloc);
}

- (void)addOptionalTopic:(id)a3
{
  -[NSMutableArray addObject:](self->_optionalTopics, "addObject:", a3);
}

- (void)flushActiveMessages
{
  -[VCControlChannel throwNotSupportedExceptionForMethod:](self, "throwNotSupportedExceptionForMethod:", CFSTR("flushActiveMessages:"));
}

- (void)throwNotSupportedExceptionForMethod:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not supported method %@"), a3);
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v3, CFSTR("Class VCControlChannel should not be instantiated directly. Use VCControlChannelFaceTime or VCControlChannelMultiWay instead."), 0));
}

- (BOOL)sendReliableMessageAndWait:(id)a3 withTopic:(id)a4
{
  -[VCControlChannel throwNotSupportedExceptionForMethod:](self, "throwNotSupportedExceptionForMethod:", CFSTR("sendReliableMessageAndWait:"), a4);
  return 0;
}

- (void)sendReliableMessage:(id)a3 withTopic:(id)a4
{
  -[VCControlChannel throwNotSupportedExceptionForMethod:](self, "throwNotSupportedExceptionForMethod:", CFSTR("sendReliableMessage:"), a4);
}

- (BOOL)sendReliableMessageAndWait:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5
{
  -[VCControlChannel throwNotSupportedExceptionForMethod:](self, "throwNotSupportedExceptionForMethod:", CFSTR("sendReliableMessageAndWait:participantID:"), a4, a5);
  return 0;
}

- (void)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5
{
  -[VCControlChannel throwNotSupportedExceptionForMethod:](self, "throwNotSupportedExceptionForMethod:", CFSTR("sendReliableMessage:participantID:"), a4, a5);
}

- (BOOL)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 timeout:(unsigned int)a6 completion:(id)a7
{
  -[VCControlChannel throwNotSupportedExceptionForMethod:](self, "throwNotSupportedExceptionForMethod:", CFSTR("sendReliableMessage:withTopic:participantID:timeout:completion:"), a4, a5, *(_QWORD *)&a6, a7);
  return 0;
}

- (BOOL)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 timeout:(unsigned int)a6 withOptions:(id)a7 completion:(id)a8
{
  -[VCControlChannel throwNotSupportedExceptionForMethod:](self, "throwNotSupportedExceptionForMethod:", CFSTR("sendReliableMessage:withTopic:participantID:timeout:completion:"), a4, a5, *(_QWORD *)&a6, a7, a8);
  return 0;
}

- (void)sendUnreliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5
{
  -[VCControlChannel throwNotSupportedExceptionForMethod:](self, "throwNotSupportedExceptionForMethod:", CFSTR("sendUnreliableMessage:participantID:"), a4, a5);
}

- (void)setEncryptionWithEncryptionMaterial:(id *)a3
{
  -[VCControlChannel throwNotSupportedExceptionForMethod:](self, "throwNotSupportedExceptionForMethod:", CFSTR("setEncryptionWithEncryptionMaterial:"));
}

- (unsigned)reliableMessageResendInterval
{
  return self->_reliableMessageResendInterval;
}

@end
