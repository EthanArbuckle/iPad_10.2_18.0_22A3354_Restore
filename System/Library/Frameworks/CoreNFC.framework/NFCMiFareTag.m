@implementation NFCMiFareTag

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFCMiFareTag;
  return -[NFCTag copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (NFCMiFareTag)initWithSession:(id)a3 tag:(id)a4 startupConfig:(int64_t)a5
{
  id v8;
  NFCMiFareTag *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NFCMiFareTag;
  v9 = -[NFCTag initWithSession:tag:startupConfig:](&v13, sel_initWithSession_tag_startupConfig_, a3, v8, a5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "type") - 14;
    if (v10 >= 3)
      v11 = 1;
    else
      v11 = v10 + 2;
    v9->_mifareFamily = v11;
  }

  return v9;
}

- (void)sendMiFareCommand:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  os_activity_scope_state_s state;

  v6 = a4;
  v7 = a3;
  v8 = _os_activity_create(&dword_215BBD000, "NFCMiFareTag sendMiFareCommand:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__NFCMiFareTag_sendMiFareCommand_completionHandler___block_invoke;
  v10[3] = &unk_24D44F888;
  v11 = v6;
  v9 = v6;
  -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v7, v10);

}

uint64_t __52__NFCMiFareTag_sendMiFareCommand_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendMiFareISO7816Command:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_215BBD000, "NFCMiFareTag sendMiFareISO7816Command:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  if (self->_mifareFamily - 3 >= 2)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __59__NFCMiFareTag_sendMiFareISO7816Command_completionHandler___block_invoke;
    v10[3] = &unk_24D44F8B0;
    v11 = v7;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v10);
    v9 = v11;
  }
  else
  {
    objc_msgSend(v6, "asData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFCTag _sendAPDU:completionHandler:](self, "_sendAPDU:completionHandler:", v9, v7);
  }

}

void __59__NFCMiFareTag_sendMiFareISO7816Command_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD, _QWORD, void *))(v1 + 16))(v1, v3, 0, 0, v2);

}

- (unint64_t)mifareFamily
{
  return self->_mifareFamily;
}

- (void)setMifareFamily:(unint64_t)a3
{
  self->_mifareFamily = a3;
}

@end
