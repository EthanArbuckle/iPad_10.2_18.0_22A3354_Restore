@implementation LDCMNotificationUIManagerV4

- (LDCMNotificationUIManagerV4)initWithParams:(__CFRunLoop *)a3 :(id)a4
{
  id v6;

  self->_liquidNotificationContext.isNotificationPosted = 0;
  self->_liquidNotificationContext.lastNotificationTime = 0.0;
  self->_liquidNotificationContext.isReinsertion = 0;
  self->_liquidNotificationContext.notification = 0;
  self->_liquidNotificationContext.notificationRunLoopSource = 0;
  self->_liquidNotificationContext.runloop = a3;
  objc_storeStrong((id *)&self->_liquidNotificationContext.notificationUIManager, self);
  v6 = a4;
  objc_storeWeak((id *)&self->_ldcmManager, v6);

  return self;
}

- (void)showUI:(id)a3 :(BOOL)a4
{
  $96EE1C12479E9B303E9C2794B92A11A2 v4;

  v4 = a3;
  IOAccessoryNotifyWet((uint64_t)&self->_liquidNotificationContext, &v4, a4);
}

- (void)setOverride:(unsigned __int8)a3
{
  uint64_t v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_ldcmManager);
  objc_msgSend(WeakRetained, "setOverride:", v3);

}

- (IOPortLDCMManagerV4)ldcmManager
{
  return (IOPortLDCMManagerV4 *)objc_loadWeakRetained((id *)&self->_ldcmManager);
}

- (void)setLdcmManager:(id)a3
{
  objc_storeWeak((id *)&self->_ldcmManager, a3);
}

- ($E8BCC389BE474BF3398A9D05C1E08415)liquidNotificationContext
{
  __int128 v4;
  $E8BCC389BE474BF3398A9D05C1E08415 *result;

  v4 = *(_OWORD *)&self->_liquidNotificationContext.isReinsertion;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_liquidNotificationContext.isNotificationPosted;
  *(_OWORD *)&retstr->var2 = v4;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->_liquidNotificationContext.notificationRunLoopSource;
  result = self->_liquidNotificationContext.notificationUIManager;
  retstr->var6 = result;
  return result;
}

- (void)setLiquidNotificationContext:(id *)a3
{
  __int128 v3;
  __int128 v4;
  LDCMNotificationUIManagerV4 *var6;
  LDCMNotificationUIManagerV4 *notificationUIManager;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_liquidNotificationContext.isReinsertion = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_liquidNotificationContext.notificationRunLoopSource = v4;
  *(_OWORD *)&self->_liquidNotificationContext.isNotificationPosted = v3;
  var6 = (LDCMNotificationUIManagerV4 *)a3->var6;
  a3->var6 = 0;
  notificationUIManager = self->_liquidNotificationContext.notificationUIManager;
  self->_liquidNotificationContext.notificationUIManager = var6;

}

- (void).cxx_destruct
{

  objc_destroyWeak((id *)&self->_ldcmManager);
}

@end
