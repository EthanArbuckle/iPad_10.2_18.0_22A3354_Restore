@implementation MTLToolsSharedEvent

- (void)notifyListener:(id)a3 atValue:(unint64_t)a4 block:(id)a5
{
  id v9;
  _QWORD v10[6];

  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__MTLToolsSharedEvent_notifyListener_atValue_block___block_invoke;
  v10[3] = &unk_24F7948E8;
  v10[4] = self;
  v10[5] = a5;
  objc_msgSend(v9, "notifyListener:atValue:block:", a3, a4, v10);
}

uint64_t __52__MTLToolsSharedEvent_notifyListener_atValue_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)newSharedEventHandle
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedEventHandle");
}

- (unint64_t)signaledValue
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "signaledValue");
}

- (void)setSignaledValue:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setSignaledValue:", a3);
}

- (NSString)label
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "label");
}

- (void)setLabel:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setLabel:", a3);
}

- (BOOL)waitUntilSignaledValue:(unint64_t)a3 timeoutMS:(unint64_t)a4
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitUntilSignaledValue:timeoutMS:", a3, a4);
}

- (IOSurfaceSharedEvent)IOSurfaceSharedEvent
{
  return (IOSurfaceSharedEvent *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "IOSurfaceSharedEvent");
}

- (BOOL)supportsRollback
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRollback");
}

@end
