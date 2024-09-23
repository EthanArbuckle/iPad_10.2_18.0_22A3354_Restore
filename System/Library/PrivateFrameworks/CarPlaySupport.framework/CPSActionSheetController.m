@implementation CPSActionSheetController

+ (id)actionSheetControllerWithActionSheet:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(id *, void *, void *, void *);
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  int v19;
  os_log_type_t v20;
  id v21;
  id location[2];
  id v23;
  id v24;
  uint8_t v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v23 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = (id)objc_msgSend(location[0], "actions");
  v9 = objc_msgSend(v8, "count") != 0;

  if (v9)
  {
    v4 = v23;
    v6 = (id)objc_msgSend(location[0], "title");
    v5 = (id)objc_msgSend(location[0], "message");
    v18 = (id)objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6);

    objc_msgSend(v18, "setActionSheet:", location[0]);
    v17 = (id)objc_msgSend(location[0], "alertDelegate");
    v7 = (id)objc_msgSend(location[0], "actions");
    v10 = MEMORY[0x24BDAC760];
    v11 = -1073741824;
    v12 = 0;
    v13 = __65__CPSActionSheetController_actionSheetControllerWithActionSheet___block_invoke;
    v14 = &unk_24E26FD40;
    v15 = v17;
    v16 = v18;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v10);

    v24 = v18;
    v19 = 1;
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v18, 0);
  }
  else
  {
    v21 = CarPlaySupportGeneralLogging();
    v20 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v25, (uint64_t)v23);
      _os_log_error_impl(&dword_21E389000, (os_log_t)v21, v20, "No actions attached to action sheet %@", v25, 0xCu);
    }
    objc_storeStrong(&v21, 0);
    v24 = 0;
    v19 = 1;
  }
  objc_storeStrong(location, 0);
  return v24;
}

void __65__CPSActionSheetController_actionSheetControllerWithActionSheet___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v6;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(id *, void *);
  void *v12;
  id v13;
  id v14;
  id v15[4];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v15[3] = a3;
  v15[2] = a4;
  v15[1] = a1;
  v6 = location[0];
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __65__CPSActionSheetController_actionSheetControllerWithActionSheet___block_invoke_2;
  v12 = &unk_24E26FD18;
  v13 = a1[4];
  v14 = location[0];
  v15[0] = (id)objc_msgSend(v6, "alertActionRepresentationWithHandler:");
  objc_msgSend(a1[5], "addAction:", v15[0]);
  objc_storeStrong(v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __65__CPSActionSheetController_actionSheetControllerWithActionSheet___block_invoke_2(id *a1, void *a2)
{
  id v2;
  id v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_msgSend(a1[4], "conformsToProtocol:", &unk_2554520A8) & 1) != 0)
  {
    v2 = a1[4];
    v3 = (id)objc_msgSend(a1[5], "identifier");
    objc_msgSend(v2, "handleAlertActionForIdentifier:");

  }
  objc_storeStrong(location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  CPActionSheetTemplate *v4;
  id v5;
  CPActionSheetTemplate *v6;
  id v7;
  CPActionSheetTemplate *v8;
  char v9;
  objc_super v10;
  BOOL v11;
  SEL v12;
  CPSActionSheetController *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSActionSheetController;
  -[CPSActionSheetController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  v8 = -[CPSActionSheetController actionSheet](v13, "actionSheet");
  v7 = (id)-[CPActionSheetTemplate alertDelegate](v8, "alertDelegate");
  v9 = objc_msgSend(v7, "conformsToProtocol:", &unk_25544C5F8);

  if ((v9 & 1) != 0)
  {
    v6 = -[CPSActionSheetController actionSheet](v13, "actionSheet");
    v5 = (id)-[CPActionSheetTemplate alertDelegate](v6, "alertDelegate");
    v4 = -[CPSActionSheetController actionSheet](v13, "actionSheet");
    v3 = (id)-[CPActionSheetTemplate identifier](v4, "identifier");
    objc_msgSend(v5, "templateWillAppearWithIdentifier:animated:");

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;
  CPActionSheetTemplate *v4;
  id v5;
  CPActionSheetTemplate *v6;
  id v7;
  CPActionSheetTemplate *v8;
  char v9;
  objc_super v10;
  BOOL v11;
  SEL v12;
  CPSActionSheetController *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSActionSheetController;
  -[CPSActionSheetController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  v8 = -[CPSActionSheetController actionSheet](v13, "actionSheet");
  v7 = (id)-[CPActionSheetTemplate alertDelegate](v8, "alertDelegate");
  v9 = objc_msgSend(v7, "conformsToProtocol:", &unk_25544C5F8);

  if ((v9 & 1) != 0)
  {
    v6 = -[CPSActionSheetController actionSheet](v13, "actionSheet");
    v5 = (id)-[CPActionSheetTemplate alertDelegate](v6, "alertDelegate");
    v4 = -[CPSActionSheetController actionSheet](v13, "actionSheet");
    v3 = (id)-[CPActionSheetTemplate identifier](v4, "identifier");
    objc_msgSend(v5, "templateDidAppearWithIdentifier:animated:");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3;
  CPActionSheetTemplate *v4;
  id v5;
  CPActionSheetTemplate *v6;
  id v7;
  CPActionSheetTemplate *v8;
  char v9;
  objc_super v10;
  BOOL v11;
  SEL v12;
  CPSActionSheetController *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSActionSheetController;
  -[CPSActionSheetController viewWillDisappear:](&v10, sel_viewWillDisappear_, a3);
  v8 = -[CPSActionSheetController actionSheet](v13, "actionSheet");
  v7 = (id)-[CPActionSheetTemplate alertDelegate](v8, "alertDelegate");
  v9 = objc_msgSend(v7, "conformsToProtocol:", &unk_25544C5F8);

  if ((v9 & 1) != 0)
  {
    v6 = -[CPSActionSheetController actionSheet](v13, "actionSheet");
    v5 = (id)-[CPActionSheetTemplate alertDelegate](v6, "alertDelegate");
    v4 = -[CPSActionSheetController actionSheet](v13, "actionSheet");
    v3 = (id)-[CPActionSheetTemplate identifier](v4, "identifier");
    objc_msgSend(v5, "templateWillDisappearWithIdentifier:animated:");

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v3;
  CPActionSheetTemplate *v4;
  id v5;
  CPActionSheetTemplate *v6;
  id v7;
  CPActionSheetTemplate *v8;
  char v9;
  objc_super v10;
  BOOL v11;
  SEL v12;
  CPSActionSheetController *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSActionSheetController;
  -[CPSActionSheetController viewDidDisappear:](&v10, sel_viewDidDisappear_, a3);
  v8 = -[CPSActionSheetController actionSheet](v13, "actionSheet");
  v7 = (id)-[CPActionSheetTemplate alertDelegate](v8, "alertDelegate");
  v9 = objc_msgSend(v7, "conformsToProtocol:", &unk_25544C5F8);

  if ((v9 & 1) != 0)
  {
    v6 = -[CPSActionSheetController actionSheet](v13, "actionSheet");
    v5 = (id)-[CPActionSheetTemplate alertDelegate](v6, "alertDelegate");
    v4 = -[CPSActionSheetController actionSheet](v13, "actionSheet");
    v3 = (id)-[CPActionSheetTemplate identifier](v4, "identifier");
    objc_msgSend(v5, "templateDidDisappearWithIdentifier:animated:");

  }
}

- (CPTemplateDelegate)templateDelegate
{
  return self->_templateDelegate;
}

- (void)setTemplateDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_templateDelegate, a3);
}

- (CPActionSheetTemplate)actionSheet
{
  return self->_actionSheet;
}

- (void)setActionSheet:(id)a3
{
  objc_storeStrong((id *)&self->_actionSheet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionSheet, 0);
  objc_storeStrong((id *)&self->_templateDelegate, 0);
}

@end
