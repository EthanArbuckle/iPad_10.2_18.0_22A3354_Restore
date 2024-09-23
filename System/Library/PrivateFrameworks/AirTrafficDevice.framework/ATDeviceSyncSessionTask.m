@implementation ATDeviceSyncSessionTask

- (ATDeviceSyncSessionTask)initWithDataClass:(id)a3 onMessageLink:(id)a4
{
  id v7;
  ATDeviceSyncSessionTask *v8;
  ATDeviceSyncSessionTask *v9;
  uint64_t v10;
  NSString *linkIdentifier;
  objc_class *v12;
  const char *Name;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  objc_super v17;

  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ATDeviceSyncSessionTask;
  v8 = -[ATSessionTask initWithDataClass:](&v17, sel_initWithDataClass_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_messageLink, a4);
    objc_msgSend(v7, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
    linkIdentifier = v9->_linkIdentifier;
    v9->_linkIdentifier = (NSString *)v10;

    v12 = (objc_class *)objc_opt_class();
    Name = class_getName(v12);
    v14 = dispatch_queue_create(Name, 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v14;

  }
  return v9;
}

- (void)updateProgressWithCount:(unint64_t)a3 totalItemCount:(unint64_t)a4
{
  double v7;

  -[ATSessionTask setCompletedItemCount:](self, "setCompletedItemCount:");
  -[ATSessionTask setTotalItemCount:](self, "setTotalItemCount:", a4);
  if (a4)
    v7 = (double)a3 / (double)a4;
  else
    v7 = 0.0;
  -[ATSessionTask setProgress:](self, "setProgress:", v7);
}

- (void)sendRequest:(id)a3 withCompletion:(id)a4
{
  -[ATConcreteMessageLink sendRequest:withCompletion:](self->_messageLink, "sendRequest:withCompletion:", a3, a4);
}

- (void)messageLink:(id)a3 didReceiveRequest:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ATDeviceSyncSessionTask;
  -[ATDeviceSyncSessionTask doesNotRecognizeSelector:](&v4, sel_doesNotRecognizeSelector_, a2, a4);
}

- (ATConcreteMessageLink)messageLink
{
  return self->_messageLink;
}

- (NSString)linkIdentifier
{
  return self->_linkIdentifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_linkIdentifier, 0);
  objc_storeStrong((id *)&self->_messageLink, 0);
}

@end
