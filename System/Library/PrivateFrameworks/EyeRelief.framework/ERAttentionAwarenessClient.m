@implementation ERAttentionAwarenessClient

- (ERAttentionAwarenessClient)init
{
  id v2;
  void *v3;
  int has_internal_content;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  dispatch_queue_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ERAttentionAwarenessClient;
  v2 = -[ERAttentionAwarenessClient init](&v20, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.EyeRelief"));
    has_internal_content = os_variant_has_internal_content();
    v5 = objc_opt_new();
    v6 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v5;

    objc_msgSend(*((id *)v2 + 3), "setIdentifier:", CFSTR("com.apple.eyerelief"));
    if (has_internal_content && objc_msgSend(v3, "BOOLForKey:", CFSTR("demoMode")))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Demo Mode is enabled"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[ERLogging log:withType:](ERLogging, "log:withType:", v7, 3);

    }
    else
    {
      objc_msgSend(*((id *)v2 + 3), "setUnityStream:", 1);
    }
    objc_msgSend(*((id *)v2 + 3), "setActivateEyeRelief:", 1);
    objc_msgSend(*((id *)v2 + 3), "setActivateAttentionDetection:", 0);
    objc_msgSend(*((id *)v2 + 3), "setContinuousFaceDetectMode:", 1);
    objc_msgSend(*((id *)v2 + 3), "setNotificationMask:", 31);
    v8 = objc_opt_new();
    v9 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v8;

    objc_msgSend(*((id *)v2 + 4), "setConfiguration:", *((_QWORD *)v2 + 3));
    v10 = dispatch_queue_create("com.apple.eyerelief.AttentionAwarenessQueue", 0);
    v11 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v10;

    dispatch_activate(*((dispatch_object_t *)v2 + 5));
    objc_initWeak(&location, v2);
    v12 = (void *)*((_QWORD *)v2 + 4);
    v13 = *((_QWORD *)v2 + 5);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __34__ERAttentionAwarenessClient_init__block_invoke;
    v17[3] = &unk_250BBBA58;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v12, "setNotificationHandlerWithQueue:block:", v13, v17);
    if (!has_internal_content || (v14 = objc_msgSend(v3, "integerForKey:", CFSTR("distanceThreshold"))) == 0)
      v14 = 300;
    *((_QWORD *)v2 + 2) = v14;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Too close distance threshold setting: %li mm"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[ERLogging log:withType:](ERLogging, "log:withType:", v15, 0);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  return (ERAttentionAwarenessClient *)v2;
}

void __34__ERAttentionAwarenessClient_init__block_invoke(uint64_t a1, char a2)
{
  void *v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void (**v7)(void);
  id v8;

  if ((a2 & 5) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Distance sampling interrupted!"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[ERLogging log:withType:](ERLogging, "log:withType:", v3, 1);

    v4 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained(v4);
    objc_msgSend(WeakRetained, "interruptHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v8 = objc_loadWeakRetained(v4);
      objc_msgSend(v8, "interruptHandler");
      v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v7[2]();

    }
  }
}

- (BOOL)cancelWithError:(id *)a3
{
  void *v4;
  char v5;
  id v6;
  void *v7;
  id v9;

  -[ERAttentionAwarenessClient attentionAwarenessClient](self, "attentionAwarenessClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v4, "cancelFaceDetectStreamWithError:", &v9);
  v6 = v9;

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to cancel AA stream: %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ERLogging log:withType:](ERLogging, "log:withType:", v7, 1);

  }
  if (a3)
    *a3 = objc_retainAutorelease(v6);

  return v6 == 0;
}

- (BOOL)invalidateWithError:(id *)a3
{
  void *v4;
  char v5;
  id v6;
  void *v7;
  id v9;

  -[ERAttentionAwarenessClient attentionAwarenessClient](self, "attentionAwarenessClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v4, "invalidateWithError:", &v9);
  v6 = v9;

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to invalidate AA client: %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ERLogging log:withType:](ERLogging, "log:withType:", v7, 1);

  }
  if (a3)
    *a3 = objc_retainAutorelease(v6);

  return v6 == 0;
}

- (void)_resumeStreamingWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ERAttentionAwarenessClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__ERAttentionAwarenessClient__resumeStreamingWithCompletion___block_invoke;
  v7[3] = &unk_250BBBA80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __61__ERAttentionAwarenessClient__resumeStreamingWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  uint64_t v6;
  void (*v7)(void);
  void *v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "attentionAwarenessClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v3 = objc_msgSend(v2, "resumeWithError:", &v10);
  v4 = v10;

  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Resumed distance streaming"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[ERLogging log:withType:](ERLogging, "log:withType:", v5, 0);

    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      v7 = *(void (**)(void))(v6 + 16);
LABEL_6:
      v7();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to resume distance streaming: %@"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ERLogging log:withType:](ERLogging, "log:withType:", v8, 1);

    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      v7 = *(void (**)(void))(v9 + 16);
      goto LABEL_6;
    }
  }

}

+ (int64_t)_categoryForDistance:(float)a3 withFaceState:(unint64_t)a4
{
  void *v6;
  double v7;

  v6 = (void *)objc_opt_class();
  *(float *)&v7 = a3;
  return objc_msgSend(v6, "_categoryForDistance:withTooCloseDistanceThreshold:withFaceState:", 300, a4, v7);
}

+ (int64_t)_categoryForDistance:(float)a3 withTooCloseDistanceThreshold:(int64_t)a4 withFaceState:(unint64_t)a5
{
  if (a5 == 2)
    return 0;
  if (a5 == 1)
    return (float)a4 <= a3;
  return 2;
}

- (void)_pollForDistanceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[ERAttentionAwarenessClient attentionAwarenessClient](self, "attentionAwarenessClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ERAttentionAwarenessClient queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__ERAttentionAwarenessClient__pollForDistanceWithCompletion___block_invoke;
  v12[3] = &unk_250BBBAA8;
  objc_copyWeak(&v14, &location);
  v8 = v4;
  v13 = v8;
  objc_msgSend(v5, "setEventStreamerWithQueue:block:", v6, v12);

  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __61__ERAttentionAwarenessClient__pollForDistanceWithCompletion___block_invoke_2;
  v10[3] = &unk_250BBBAD0;
  v9 = v8;
  v11 = v9;
  -[ERAttentionAwarenessClient _resumeStreamingWithCompletion:](self, "_resumeStreamingWithCompletion:", v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __61__ERAttentionAwarenessClient__pollForDistanceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  float v7;
  id WeakRetained;
  uint64_t v9;
  double v10;
  int64_t v11;
  void *v12;
  unint64_t v13;
  ERDistanceEvent *v14;
  double v15;
  ERDistanceEvent *v16;
  uint64_t v17;
  ERDistanceEvent *v18;

  v3 = a2;
  objc_msgSend(v3, "distance");
  v5 = v4;
  v6 = objc_msgSend(v3, "faceState");
  +[ERAttentionAwarenessClient reportAnalyticsFaceDetectAttentionEvent:](ERAttentionAwarenessClient, "reportAnalyticsFaceDetectAttentionEvent:", v3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = objc_msgSend(WeakRetained, "tooCloseDistanceThreshold");
  v7 = v5;
  *(float *)&v10 = v7;
  v11 = +[ERAttentionAwarenessClient _categoryForDistance:withTooCloseDistanceThreshold:withFaceState:](ERAttentionAwarenessClient, "_categoryForDistance:withTooCloseDistanceThreshold:withFaceState:", v9, v6, v10);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ER Distance: %f, ER Face State: %llu"), *(_QWORD *)&v5, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[ERLogging log:withType:](ERLogging, "log:withType:", v12, 0);

  v13 = objc_msgSend(v3, "eventMask");
  v14 = [ERDistanceEvent alloc];
  *(float *)&v15 = v5;
  v16 = -[ERDistanceEvent initWithDistance:distanceCategory:andAttention:](v14, "initWithDistance:distanceCategory:andAttention:", v11, (v13 >> 7) & 1, v15);
  v17 = *(_QWORD *)(a1 + 32);
  if (v17)
  {
    v18 = v16;
    (*(void (**)(void))(v17 + 16))();
    v16 = v18;
  }

}

uint64_t __61__ERAttentionAwarenessClient__pollForDistanceWithCompletion___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  }
  return result;
}

+ (void)reportAnalyticsFaceDetectAttentionEvent:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

id __70__ERAttentionAwarenessClient_reportAnalyticsFaceDetectAttentionEvent___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("aw_distance");
  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "distance");
  objc_msgSend(v2, "numberWithDouble:", v3 * 0.1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("aw_face_state");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "faceState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)interruptHandler
{
  return self->_interruptHandler;
}

- (void)setInterruptHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)tooCloseDistanceThreshold
{
  return self->_tooCloseDistanceThreshold;
}

- (void)setTooCloseDistanceThreshold:(int64_t)a3
{
  self->_tooCloseDistanceThreshold = a3;
}

- (AWAttentionAwarenessConfiguration)attentionAwarenessConfiguration
{
  return self->_attentionAwarenessConfiguration;
}

- (void)setAttentionAwarenessConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_attentionAwarenessConfiguration, a3);
}

- (AWAttentionAwarenessClient)attentionAwarenessClient
{
  return self->_attentionAwarenessClient;
}

- (void)setAttentionAwarenessClient:(id)a3
{
  objc_storeStrong((id *)&self->_attentionAwarenessClient, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessConfiguration, 0);
  objc_storeStrong(&self->_interruptHandler, 0);
}

@end
