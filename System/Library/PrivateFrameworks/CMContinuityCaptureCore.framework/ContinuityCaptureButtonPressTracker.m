@implementation ContinuityCaptureButtonPressTracker

- (ContinuityCaptureButtonPressTracker)init
{
  ContinuityCaptureButtonPressTracker *v2;
  NSMutableSet *v3;
  NSMutableSet *buttonPressStateByUsage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ContinuityCaptureButtonPressTracker;
  v2 = -[ContinuityCaptureButtonPressTracker init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    buttonPressStateByUsage = v2->_buttonPressStateByUsage;
    v2->_buttonPressStateByUsage = v3;

    v2->_buttonLongPressTimeout = 500000000;
  }
  return v2;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%p] _buttonPressStateByUsage:%@"), self, self->_buttonPressStateByUsage);
}

- (BOOL)valid
{
  unint64_t HostTimeInNanoSec;
  unint64_t creationTime;
  unint64_t v5;
  NSObject *v6;
  unint64_t v7;
  unint64_t buttonLongPressTimeout;
  int v10;
  ContinuityCaptureButtonPressTracker *v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  HostTimeInNanoSec = CMContinuityCaptureGetHostTimeInNanoSec();
  creationTime = self->_creationTime;
  v5 = HostTimeInNanoSec - creationTime;
  if (HostTimeInNanoSec < creationTime)
    return 0;
  CMContinuityCaptureLog(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self->_creationTime;
    buttonLongPressTimeout = self->_buttonLongPressTimeout;
    v10 = 138544130;
    v11 = self;
    v12 = 2048;
    v13 = v7;
    v14 = 2048;
    v15 = v5;
    v16 = 2048;
    v17 = buttonLongPressTimeout;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ _creationTime:%llu pressDelta:%llu _buttonLongPressTimeout:%llu", (uint8_t *)&v10, 0x2Au);
  }

  return !-[NSMutableSet count](self->_buttonPressStateByUsage, "count") && v5 < self->_buttonLongPressTimeout;
}

- (void)registerCordPress:(int64_t)a3 down:(BOOL)a4
{
  NSMutableSet *buttonPressStateByUsage;
  NSMutableSet *v5;
  id v6;

  if (a3 == 48 && a4)
  {
    self->_creationTime = CMContinuityCaptureGetHostTimeInNanoSec();
    return;
  }
  if (a3 != 48 && a4)
  {
    buttonPressStateByUsage = self->_buttonPressStateByUsage;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](buttonPressStateByUsage, "addObject:", v6);
LABEL_8:

    return;
  }
  if (a3 != 48 && !a4 && !self->_creationTime)
  {
    v5 = self->_buttonPressStateByUsage;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](v5, "removeObject:", v6);
    goto LABEL_8;
  }
}

- (void)clear
{
  -[NSMutableSet removeAllObjects](self->_buttonPressStateByUsage, "removeAllObjects");
  self->_creationTime = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonPressStateByUsage, 0);
}

@end
