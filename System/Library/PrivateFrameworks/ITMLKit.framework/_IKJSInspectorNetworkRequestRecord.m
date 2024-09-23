@implementation _IKJSInspectorNetworkRequestRecord

- (void)_dispatchEvent:(int64_t)a3 block:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[_IKJSInspectorSynchronousNetworkRequestRecord _processEventType:](self, "_processEventType:", a3);
  -[_IKJSInspectorSynchronousNetworkRequestRecord loader](self, "loader");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dispatchEventWithBlock:", v6);

}

@end
