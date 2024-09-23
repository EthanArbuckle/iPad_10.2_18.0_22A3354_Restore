@implementation BLTPingHandlerHolder

- (void)setSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setForNotification:(BOOL)a3
{
  self->_forNotification = a3;
}

- (void)setForBulletin:(BOOL)a3
{
  self->_forBulletin = a3;
}

- (void)setAckType:(unint64_t)a3
{
  self->_ackType = a3;
}

- (BLTPingHandlerHolder)initWithPingHandler:(id)a3
{
  id v4;
  BLTPingHandlerHolder *v5;
  uint64_t v6;
  id pingHandler;
  objc_super v9;

  v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)BLTPingHandlerHolder;
    v5 = -[BLTPingHandlerHolder init](&v9, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      pingHandler = v5->_pingHandler;
      v5->_pingHandler = (id)v6;

    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (BOOL)canAck
{
  return self->_ackType != 0;
}

- (BOOL)canAckOnLocalConnection
{
  return self->_ackType == 3;
}

- (BLTPingHandlerHolder)init
{
  return -[BLTPingHandlerHolder initWithPingHandler:](self, "initWithPingHandler:", 0);
}

- (void)_performPingWithAckableForwardBlock:(id)a3 ackableNoParametersBlock:(id)a4 noAckBlock:(id)a5 clientAck:(id)a6
{
  void (**v10)(void);
  void (**v11)(void);
  void (**v12)(id, uint64_t);
  unint64_t ackType;
  void (**v14)(void);
  void (**v15)(void);

  v15 = (void (**)(void))a3;
  v10 = (void (**)(void))a4;
  v11 = (void (**)(void))a5;
  v12 = (void (**)(id, uint64_t))a6;
  if (!-[BLTPingHandlerHolder canAck](self, "canAck"))
  {
    v14 = v11;
    if (v12)
    {
      v12[2](v12, 1);
      v14 = v11;
    }
    goto LABEL_7;
  }
  ackType = self->_ackType;
  v14 = v15;
  if (ackType - 2 < 2 || (v14 = v10, ackType == 1))
LABEL_7:
    v14[2]();

}

- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4 ack:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke;
  v22[3] = &unk_24D761D98;
  v22[4] = self;
  v23 = v9;
  v24 = v8;
  v25 = v10;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_2;
  v18[3] = &unk_24D761D98;
  v18[4] = self;
  v19 = v23;
  v20 = v24;
  v21 = v25;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_3;
  v15[3] = &unk_24D761D70;
  v15[4] = self;
  v16 = v19;
  v17 = v20;
  v12 = v20;
  v13 = v19;
  v14 = v25;
  -[BLTPingHandlerHolder _performPingWithAckableForwardBlock:ackableNoParametersBlock:noAckBlock:clientAck:](self, "_performPingWithAckableForwardBlock:ackableNoParametersBlock:noAckBlock:clientAck:", v22, v18, v15, v14);

}

void __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = MEMORY[0x219A0C15C](*(_QWORD *)(a1[4] + 8));
  v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v2;
  v4 = a1[5];
  v5 = a1[6];
  v6 = (void *)a1[7];
  if (v6)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_2;
    v7[3] = &unk_24D7625F8;
    v8 = v6;
    ((void (**)(_QWORD, uint64_t, uint64_t, _QWORD *))v3)[2](v3, v4, v5, v7);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, a1[5], a1[6], 0);
  }

}

uint64_t __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a2 != 1)
  {
    if (!a2)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    blt_general_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_2_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = MEMORY[0x219A0C15C](*(_QWORD *)(a1[4] + 8));
  v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v2;
  v4 = a1[5];
  v5 = a1[6];
  v6 = (void *)a1[7];
  if (v6)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_2_3;
    v7[3] = &unk_24D761B98;
    v8 = v6;
    ((void (**)(_QWORD, uint64_t, uint64_t, _QWORD *))v3)[2](v3, v4, v5, v7);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, a1[5], a1[6], 0);
  }

}

uint64_t __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_2_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_3(_QWORD *a1)
{
  id v2;

  v2 = (id)MEMORY[0x219A0C15C](*(_QWORD *)(a1[4] + 8));
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, a1[5], a1[6]);

}

- (void)pingWithBulletin:(id)a3 ack:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  BLTWorkQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__BLTPingHandlerHolder_pingWithBulletin_ack___block_invoke;
  block[3] = &unk_24D761D48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __45__BLTPingHandlerHolder_pingWithBulletin_ack___block_invoke(_QWORD *a1)
{
  _BYTE *v2;
  uint64_t v3;
  id v4;

  v2 = (_BYTE *)a1[4];
  if (v2[17])
  {
    objc_msgSend(MEMORY[0x24BDF8818], "notificationForBulletin:", a1[5]);
    v3 = objc_claimAutoreleasedReturnValue();
    v2 = (_BYTE *)a1[4];
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  objc_msgSend(v2, "pingWithBulletin:notification:ack:", a1[5], v3, a1[6]);

}

- (void)pingWithBulletin:(id)a3 notification:(id)a4 ack:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke;
  v22[3] = &unk_24D762620;
  v22[4] = self;
  v23 = v9;
  v25 = v10;
  v24 = v8;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke_4;
  v18[3] = &unk_24D762620;
  v18[4] = self;
  v19 = v23;
  v21 = v25;
  v20 = v24;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke_4;
  v15[3] = &unk_24D761D70;
  v15[4] = self;
  v16 = v19;
  v17 = v20;
  v12 = v20;
  v13 = v19;
  v14 = v25;
  -[BLTPingHandlerHolder _performPingWithAckableForwardBlock:ackableNoParametersBlock:noAckBlock:clientAck:](self, "_performPingWithAckableForwardBlock:ackableNoParametersBlock:noAckBlock:clientAck:", v22, v18, v15, v14);

}

void __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = a1[4];
  v3 = *(unsigned __int8 *)(v2 + 17);
  v4 = MEMORY[0x219A0C15C](*(_QWORD *)(v2 + 8));
  v5 = (void *)a1[7];
  v7 = (id)v4;
  if (v3)
  {
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, a1[5], v5);

  }
  else
  {
    v6 = a1[6];
    if (v5)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke_2;
      v8[3] = &unk_24D7625F8;
      v9 = v5;
      (*((void (**)(id, uint64_t, _QWORD *))v7 + 2))(v7, v6, v8);

    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v6);
    }

  }
}

uint64_t __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a2 != 1)
  {
    if (!a2)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    blt_general_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_2_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v2 = a1[4];
  v3 = *(unsigned __int8 *)(v2 + 17);
  v4 = MEMORY[0x219A0C15C](*(_QWORD *)(v2 + 8));
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  v6 = (void *)a1[7];
  if (!v3)
  {
    v7 = a1[6];
    if (v6)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke_3;
      v9[3] = &unk_24D761B98;
      v10 = v6;
      ((void (**)(_QWORD, uint64_t, _QWORD *))v5)[2](v5, v7, v9);
      v8 = v10;
      goto LABEL_6;
    }
LABEL_7:
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, v7, 0);
    goto LABEL_8;
  }
  v7 = a1[5];
  if (!v6)
    goto LABEL_7;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke_2_5;
  v11[3] = &unk_24D761B98;
  v12 = v6;
  ((void (**)(_QWORD, uint64_t, _QWORD *))v5)[2](v5, v7, v11);
  v8 = v12;
LABEL_6:

LABEL_8:
}

uint64_t __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke_2_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 17);
  v4 = MEMORY[0x219A0C15C](*(_QWORD *)(v2 + 8));
  v6 = (id)v4;
  v5 = 40;
  if (!v3)
    v5 = 48;
  (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + v5));

}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (BOOL)forBulletin
{
  return self->_forBulletin;
}

- (BOOL)forNotification
{
  return self->_forNotification;
}

- (unint64_t)ackType
{
  return self->_ackType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong(&self->_pingHandler, 0);
}

void __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_2173D9000, a1, a3, "Unknown ack forward value", a5, a6, a7, a8, 0);
}

@end
