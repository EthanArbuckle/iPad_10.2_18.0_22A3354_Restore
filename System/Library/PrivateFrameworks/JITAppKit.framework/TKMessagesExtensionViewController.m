@implementation TKMessagesExtensionViewController

- (void)willBecomeActiveWithConversation:(id)a3
{
  TKMessagesExtensionViewController *v3;
  id v4;
  id location[2];
  TKMessagesExtensionViewController *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  v7[0] = location[0];
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  -[TKMessagesExtensionViewController emitTMLSignal:withArguments:](v3, "emitTMLSignal:withArguments:", CFSTR("willBecomeActive"));

  objc_storeStrong(location, 0);
}

- (void)didResignActiveWithConversation:(id)a3
{
  TKMessagesExtensionViewController *v3;
  id v4;
  id location[2];
  TKMessagesExtensionViewController *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  v7[0] = location[0];
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  -[TKMessagesExtensionViewController emitTMLSignal:withArguments:](v3, "emitTMLSignal:withArguments:", CFSTR("didResignActive"));

  objc_storeStrong(location, 0);
}

- (void)didReceiveMessage:(id)a3 conversation:(id)a4
{
  TKMessagesExtensionViewController *v5;
  id v6;
  id v7;
  id location[2];
  TKMessagesExtensionViewController *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = v9;
  v10[0] = location[0];
  v10[1] = v7;
  v6 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  -[TKMessagesExtensionViewController emitTMLSignal:withArguments:](v5, "emitTMLSignal:withArguments:", CFSTR("didReceive"));

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)didStartSendingMessage:(id)a3 conversation:(id)a4
{
  TKMessagesExtensionViewController *v5;
  id v6;
  id v7;
  id location[2];
  TKMessagesExtensionViewController *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = v9;
  v10[0] = location[0];
  v10[1] = v7;
  v6 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  -[TKMessagesExtensionViewController emitTMLSignal:withArguments:](v5, "emitTMLSignal:withArguments:", CFSTR("didStartSending"));

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)didCancelSendingMessage:(id)a3 conversation:(id)a4
{
  TKMessagesExtensionViewController *v5;
  id v6;
  id v7;
  id location[2];
  TKMessagesExtensionViewController *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = v9;
  v10[0] = location[0];
  v10[1] = v7;
  v6 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  -[TKMessagesExtensionViewController emitTMLSignal:withArguments:](v5, "emitTMLSignal:withArguments:", CFSTR("didCancelSendingMessage"));

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  id v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3);
  v6[0] = v5;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  -[TKMessagesExtensionViewController emitTMLSignal:withArguments:](self, "emitTMLSignal:withArguments:", CFSTR("willTransitionToPresentationStyle"));

}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  id v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3);
  v6[0] = v5;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  -[TKMessagesExtensionViewController emitTMLSignal:withArguments:](self, "emitTMLSignal:withArguments:", CFSTR("didTransitionToPresentationStyle"));

}

@end
