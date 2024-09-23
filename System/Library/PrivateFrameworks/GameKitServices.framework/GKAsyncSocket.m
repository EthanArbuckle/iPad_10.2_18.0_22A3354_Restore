@implementation GKAsyncSocket

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_class *v4;

  v4 = (objc_class *)a1;
  if ((id)objc_opt_self() == a1)
    v4 = (objc_class *)objc_opt_self();
  return NSAllocateObject(v4, 0, a3);
}

- (void)tcpAttachSocketDescriptor:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKAsyncSocket;
  -[GKAsyncSocket doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
}

- (void)tcpConnectSockAddr:(const sockaddr *)a3 port:(unsigned __int16)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKAsyncSocket;
  -[GKAsyncSocket doesNotRecognizeSelector:](&v4, sel_doesNotRecognizeSelector_, a2, a4);
}

- (void)invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GKAsyncSocket;
  -[GKAsyncSocket doesNotRecognizeSelector:](&v2, sel_doesNotRecognizeSelector_, a2);
}

- (void)sendData:(id)a3 withCompletionHandler:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKAsyncSocket;
  -[GKAsyncSocket doesNotRecognizeSelector:](&v4, sel_doesNotRecognizeSelector_, a2, a4);
}

- (id)syncQueue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKAsyncSocket;
  -[GKAsyncSocket doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (OS_dispatch_queue)targetQueue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKAsyncSocket;
  -[GKAsyncSocket doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (id)receiveDataHandler
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKAsyncSocket;
  -[GKAsyncSocket doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (id)connectedHandler
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKAsyncSocket;
  -[GKAsyncSocket doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (id)socketName
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKAsyncSocket;
  -[GKAsyncSocket doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (void)setSyncQueue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKAsyncSocket;
  -[GKAsyncSocket doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
}

- (void)setTargetQueue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKAsyncSocket;
  -[GKAsyncSocket doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
}

- (void)setReceiveDataHandler:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKAsyncSocket;
  -[GKAsyncSocket doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
}

- (void)setConnectedHandler:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKAsyncSocket;
  -[GKAsyncSocket doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
}

- (void)setSocketName:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKAsyncSocket;
  -[GKAsyncSocket doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
}

@end
