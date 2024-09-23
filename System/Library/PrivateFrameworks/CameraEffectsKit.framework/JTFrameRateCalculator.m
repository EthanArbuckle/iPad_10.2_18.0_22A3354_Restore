@implementation JTFrameRateCalculator

- (JTFrameRateCalculator)initWithWindowSize:(double)a3
{
  JTFrameRateCalculator *v4;
  JTFrameRateCalculator *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)JTFrameRateCalculator;
  v4 = -[JTFrameRateCalculator init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_windowSize = a3;
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("com.apple.%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_retainAutorelease(v9);
    v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "UTF8String"), 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;

    -[JTFrameRateCalculator JT_restart](v5, "JT_restart");
  }
  return v5;
}

- (void)log:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __29__JTFrameRateCalculator_log___block_invoke;
  v7[3] = &unk_24EE580A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __29__JTFrameRateCalculator_log___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  unint64_t v9;
  float v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  float v24;
  uint8_t buf[4];
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "stateDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  v4 = v3;

  objc_msgSend(*(id *)(a1 + 32), "windowSize");
  if (v5 > 0.0)
  {
    v6 = -v4;
    objc_msgSend(*(id *)(a1 + 32), "windowSize");
    if (v7 < -v4)
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "receivedRenderCount");
      v9 = v8 - objc_msgSend(*(id *)(a1 + 32), "droppedRenderCount");
      v10 = (double)(v9 - objc_msgSend(*(id *)(a1 + 32), "droppedDisplayFrameCount")) / v6;
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("JTLogFPS"));

      if (v12)
      {
        +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "debugFrameRateLabel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        JFXLog_core();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = (double)v9 / v6;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "receivedRenderCount"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "droppedRenderCount"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "receivedDisplayFrameCount"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "droppedDisplayFrameCount"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219778;
          v26 = v16;
          v27 = 2048;
          v28 = v10;
          v29 = 2112;
          v30 = v17;
          v31 = 2112;
          v32 = v18;
          v33 = 2112;
          v34 = v19;
          v35 = 2112;
          v36 = v20;
          v37 = 2112;
          v38 = v14;
          v39 = 2112;
          v40 = v21;
          _os_log_impl(&dword_2269A9000, v15, OS_LOG_TYPE_DEFAULT, "Processed FPS (%f); Display FPS (%f); recieved (%@); dropped (%@); frameCount(%@); droppedDisplay(%@); cameraRate (%@) [%@]",
            buf,
            0x52u);

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "JT_restart");
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __29__JTFrameRateCalculator_log___block_invoke_6;
      v22[3] = &unk_24EE5ABF0;
      v23 = *(id *)(a1 + 40);
      v24 = v10;
      dispatch_async(MEMORY[0x24BDAC9B8], v22);

    }
  }
}

uint64_t __29__JTFrameRateCalculator_log___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, float))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(float *)(a1 + 40));
}

- (void)tickReceived
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__JTFrameRateCalculator_tickReceived__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __37__JTFrameRateCalculator_tickReceived__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setReceivedRenderCount:", objc_msgSend(*(id *)(a1 + 32), "receivedRenderCount") + 1);
}

- (void)tickDropped
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__JTFrameRateCalculator_tickDropped__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __36__JTFrameRateCalculator_tickDropped__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDroppedRenderCount:", objc_msgSend(*(id *)(a1 + 32), "droppedRenderCount") + 1);
}

- (void)tickFrameReceived
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__JTFrameRateCalculator_tickFrameReceived__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __42__JTFrameRateCalculator_tickFrameReceived__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setReceivedDisplayFrameCount:", objc_msgSend(*(id *)(a1 + 32), "receivedDisplayFrameCount") + 1);
}

- (void)tickDroppedDisplay
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__JTFrameRateCalculator_tickDroppedDisplay__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __43__JTFrameRateCalculator_tickDroppedDisplay__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDroppedDisplayFrameCount:", objc_msgSend(*(id *)(a1 + 32), "droppedDisplayFrameCount") + 1);
}

- (void)JT_restart
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__JTFrameRateCalculator_JT_restart__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __35__JTFrameRateCalculator_JT_restart__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setStateDate:", v2);

  objc_msgSend(*(id *)(a1 + 32), "setReceivedRenderCount:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setDroppedRenderCount:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setReceivedDisplayFrameCount:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setDroppedDisplayFrameCount:", 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)receivedRenderCount
{
  return self->_receivedRenderCount;
}

- (void)setReceivedRenderCount:(unint64_t)a3
{
  self->_receivedRenderCount = a3;
}

- (unint64_t)droppedRenderCount
{
  return self->_droppedRenderCount;
}

- (void)setDroppedRenderCount:(unint64_t)a3
{
  self->_droppedRenderCount = a3;
}

- (unint64_t)receivedDisplayFrameCount
{
  return self->_receivedDisplayFrameCount;
}

- (void)setReceivedDisplayFrameCount:(unint64_t)a3
{
  self->_receivedDisplayFrameCount = a3;
}

- (unint64_t)droppedDisplayFrameCount
{
  return self->_droppedDisplayFrameCount;
}

- (void)setDroppedDisplayFrameCount:(unint64_t)a3
{
  self->_droppedDisplayFrameCount = a3;
}

- (double)windowSize
{
  return self->_windowSize;
}

- (void)setWindowSize:(double)a3
{
  self->_windowSize = a3;
}

- (NSDate)stateDate
{
  return self->_stateDate;
}

- (void)setStateDate:(id)a3
{
  objc_storeStrong((id *)&self->_stateDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
