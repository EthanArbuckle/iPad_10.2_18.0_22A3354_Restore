@implementation ServiceAlertQueue

- (ServiceAlertQueue)init
{
  ServiceAlertQueue *v2;
  id v3;
  SSXPCConnection *v4;
  SSXPCConnection *connection;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ServiceAlertQueue;
  v2 = -[ServiceAlertQueue init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)SSXPCConnection);
    v4 = (SSXPCConnection *)objc_msgSend(v3, "initWithServiceName:", SSXPCPrivateServiceName);
    connection = v2->_connection;
    v2->_connection = v4;

  }
  return v2;
}

+ (id)defaultQueue
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025E78;
  block[3] = &unk_100049D30;
  block[4] = a1;
  if (qword_1000633B8 != -1)
    dispatch_once(&qword_1000633B8, block);
  return (id)qword_1000633B0;
}

- (void)getNextAlertForClassName:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ServiceAlertProxy *v9;
  void *v10;
  SSXPCConnection *connection;
  id v12;
  ServiceAlertProxy *v13;
  _QWORD v14[4];
  ServiceAlertProxy *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = (void *)SSXPCCreateMessageDictionary(142);
  SSXPCDictionarySetCFObject(v8, "1", v7);

  v9 = objc_alloc_init(ServiceAlertProxy);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAlertProxy receiverEndpoint](v9, "receiverEndpoint"));
  xpc_dictionary_set_value(v8, "2", v10);

  connection = self->_connection;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100025FAC;
  v14[3] = &unk_100049FC8;
  v15 = v9;
  v16 = v6;
  v12 = v6;
  v13 = v9;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v8, v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
