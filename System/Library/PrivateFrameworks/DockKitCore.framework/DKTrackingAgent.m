@implementation DKTrackingAgent

- (DKTrackingAgent)initWithClientApplicationID:(id)a3
{
  id v4;
  DKTrackingAgent *v5;
  ObjectTrackingAgent *v6;
  ObjectTrackingAgent *agent;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *isTrackingSemaphore;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *isButtonEnabledSemaphore;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DKTrackingAgent;
  v5 = -[DKTrackingAgent init](&v13, sel_init);
  if (v5)
  {
    v6 = -[ObjectTrackingAgent initWithAppID:]([ObjectTrackingAgent alloc], "initWithAppID:", v4);
    agent = v5->_agent;
    v5->_agent = v6;

    v8 = dispatch_semaphore_create(1);
    isTrackingSemaphore = v5->_isTrackingSemaphore;
    v5->_isTrackingSemaphore = (OS_dispatch_semaphore *)v8;

    v10 = dispatch_semaphore_create(1);
    isButtonEnabledSemaphore = v5->_isButtonEnabledSemaphore;
    v5->_isButtonEnabledSemaphore = (OS_dispatch_semaphore *)v10;

    v5->_isTracking = 0;
    v5->_trackingButtonEnabled = 0;
  }

  return v5;
}

intptr_t __27__DKTrackingAgent_tracking__block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  dispatch_time_t v5;

  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v5 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v4, v5);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 16));
}

- (BOOL)tracking
{
  ObjectTrackingAgent *agent;
  NSObject *isTrackingSemaphore;
  dispatch_time_t v5;
  _QWORD v7[5];

  agent = self->_agent;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __27__DKTrackingAgent_tracking__block_invoke;
  v7[3] = &unk_250B71EB8;
  v7[4] = self;
  -[ObjectTrackingAgent isTrackingWithCompletionHandler:](agent, "isTrackingWithCompletionHandler:", v7);
  isTrackingSemaphore = self->_isTrackingSemaphore;
  v5 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(isTrackingSemaphore, v5);
  LOBYTE(isTrackingSemaphore) = self->_isTracking;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_isTrackingSemaphore);
  return (char)isTrackingSemaphore;
}

- (DKTrackingAgent)init
{
  DKTrackingAgent *v2;
  ObjectTrackingAgent *v3;
  ObjectTrackingAgent *agent;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *isTrackingSemaphore;
  dispatch_semaphore_t v7;
  OS_dispatch_semaphore *isButtonEnabledSemaphore;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DKTrackingAgent;
  v2 = -[DKTrackingAgent init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ObjectTrackingAgent);
    agent = v2->_agent;
    v2->_agent = v3;

    v5 = dispatch_semaphore_create(1);
    isTrackingSemaphore = v2->_isTrackingSemaphore;
    v2->_isTrackingSemaphore = (OS_dispatch_semaphore *)v5;

    v7 = dispatch_semaphore_create(1);
    isButtonEnabledSemaphore = v2->_isButtonEnabledSemaphore;
    v2->_isButtonEnabledSemaphore = (OS_dispatch_semaphore *)v7;

    v2->_isTracking = 0;
    v2->_trackingButtonEnabled = 0;
  }
  return v2;
}

- (DKTrackingAgent)initWithConfiguration:(id)a3
{
  id v4;
  DKTrackingAgent *v5;
  ObjectTrackingAgent *v6;
  ObjectTrackingAgent *agent;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *isTrackingSemaphore;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *isButtonEnabledSemaphore;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DKTrackingAgent;
  v5 = -[DKTrackingAgent init](&v13, sel_init);
  if (v5)
  {
    v6 = -[ObjectTrackingAgent initWithConfig:]([ObjectTrackingAgent alloc], "initWithConfig:", v4);
    agent = v5->_agent;
    v5->_agent = v6;

    v8 = dispatch_semaphore_create(1);
    isTrackingSemaphore = v5->_isTrackingSemaphore;
    v5->_isTrackingSemaphore = (OS_dispatch_semaphore *)v8;

    v10 = dispatch_semaphore_create(1);
    isButtonEnabledSemaphore = v5->_isButtonEnabledSemaphore;
    v5->_isButtonEnabledSemaphore = (OS_dispatch_semaphore *)v10;

    v5->_isTracking = 0;
    v5->_trackingButtonEnabled = 0;
  }

  return v5;
}

- (DKTrackingAgent)initWithTrackerConfiguration:(id)a3
{
  id v4;
  DKTrackingAgent *v5;
  ObjectTrackingAgent *v6;
  ObjectTrackingAgent *agent;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *isTrackingSemaphore;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *isButtonEnabledSemaphore;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DKTrackingAgent;
  v5 = -[DKTrackingAgent init](&v13, sel_init);
  if (v5)
  {
    v6 = -[ObjectTrackingAgent initWithTrackerConfig:]([ObjectTrackingAgent alloc], "initWithTrackerConfig:", v4);
    agent = v5->_agent;
    v5->_agent = v6;

    v8 = dispatch_semaphore_create(1);
    isTrackingSemaphore = v5->_isTrackingSemaphore;
    v5->_isTrackingSemaphore = (OS_dispatch_semaphore *)v8;

    v10 = dispatch_semaphore_create(1);
    isButtonEnabledSemaphore = v5->_isButtonEnabledSemaphore;
    v5->_isButtonEnabledSemaphore = (OS_dispatch_semaphore *)v10;

    v5->_isTracking = 0;
    v5->_trackingButtonEnabled = 0;
  }

  return v5;
}

- (void)dealloc
{
  ObjectTrackingAgent *agent;
  objc_super v4;

  NSLog(CFSTR("DKTrackingAgent: dealloc"), a2);
  -[ObjectTrackingAgent stop](self->_agent, "stop");
  agent = self->_agent;
  self->_agent = 0;

  v4.receiver = self;
  v4.super_class = (Class)DKTrackingAgent;
  -[DKTrackingAgent dealloc](&v4, sel_dealloc);
}

- (void)trackWithMetadata:(id)a3 image:(id)a4 cameraPortType:(id)a5 cameraIntrinsics:(id)a6 referenceDimensions:(CGSize)a7 orientation:(int)a8 completionHandler:(id)a9
{
  uint64_t v10;
  double height;
  double width;
  ObjectTrackingAgent *agent;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = *(_QWORD *)&a8;
  height = a7.height;
  width = a7.width;
  v23 = a4;
  agent = self->_agent;
  v18 = a9;
  v19 = a6;
  v20 = a5;
  v21 = a3;
  if (-[ObjectTrackingAgent customInferenceEnabled](agent, "customInferenceEnabled"))
    v22 = v23;
  else
    v22 = 0;
  -[ObjectTrackingAgent trackWithMetadata:image:cameraPortType:cameraIntrinsics:referenceDimensions:orientation:completionHandler:](self->_agent, "trackWithMetadata:image:cameraPortType:cameraIntrinsics:referenceDimensions:orientation:completionHandler:", v21, v22, v20, v19, v10, v18, width, height);

}

- (void)trackWithFocusObservations:(id)a3 metaData:(id)a4 image:(id)a5 cameraPortType:(id)a6 cameraIntrinsics:(id)a7 referenceDimensions:(CGSize)a8 orientation:(int)a9 completionHandler:(id)a10
{
  uint64_t v10;
  double height;
  double width;
  ObjectTrackingAgent *agent;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  ObjectTrackingAgent *v24;
  void *v25;
  id v26;
  id v27;

  v10 = *(_QWORD *)&a9;
  height = a8.height;
  width = a8.width;
  v27 = a5;
  agent = self->_agent;
  v19 = a10;
  v20 = a7;
  v21 = a6;
  v22 = a4;
  v23 = a3;
  LODWORD(agent) = -[ObjectTrackingAgent customInferenceEnabled](agent, "customInferenceEnabled");
  v24 = self->_agent;
  objc_msgSend(v23, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)agent)
    v26 = v27;
  else
    v26 = 0;
  -[ObjectTrackingAgent trackWithFocusObservation:metadata:image:cameraPortType:cameraIntrinsics:referenceDimensions:orientation:completionHandler:](v24, "trackWithFocusObservation:metadata:image:cameraPortType:cameraIntrinsics:referenceDimensions:orientation:completionHandler:", v25, v22, v26, v21, v20, v10, width, height, v19);

}

- (void)stop
{
  -[ObjectTrackingAgent stop](self->_agent, "stop");
}

- (id)getTrackedObjects
{
  return -[ObjectTrackingAgent getTrackedObjects](self->_agent, "getTrackedObjects");
}

- (id)getSelectedFaceIds
{
  return -[ObjectTrackingAgent getSelectedFaceIds](self->_agent, "getSelectedFaceIds");
}

- (id)getSelectedBodyIds
{
  return -[ObjectTrackingAgent getSelectedBodyIds](self->_agent, "getSelectedBodyIds");
}

- (void)processImageWithImage:(id)a3 faces:(id)a4
{
  -[ObjectTrackingAgent processImageWithImage:faces:completionHandler:](self->_agent, "processImageWithImage:faces:completionHandler:", a3, a4, &__block_literal_global);
}

- (BOOL)docked
{
  return -[ObjectTrackingAgent docked](self->_agent, "docked");
}

- (BOOL)trackingButtonEnabled
{
  ObjectTrackingAgent *agent;
  NSObject *isButtonEnabledSemaphore;
  dispatch_time_t v5;
  _QWORD v7[5];

  agent = self->_agent;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__DKTrackingAgent_trackingButtonEnabled__block_invoke;
  v7[3] = &unk_250B71EB8;
  v7[4] = self;
  -[ObjectTrackingAgent trackingButtonEnabledWithCompletionHandler:](agent, "trackingButtonEnabledWithCompletionHandler:", v7);
  isButtonEnabledSemaphore = self->_isButtonEnabledSemaphore;
  v5 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(isButtonEnabledSemaphore, v5);
  LOBYTE(isButtonEnabledSemaphore) = self->_trackingButtonEnabled;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_isButtonEnabledSemaphore);
  return (char)isButtonEnabledSemaphore;
}

intptr_t __40__DKTrackingAgent_trackingButtonEnabled__block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  dispatch_time_t v5;

  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v5 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v4, v5);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)setRectOfInterest:(CGRect)a3 completion:(id)a4
{
  -[ObjectTrackingAgent setRectOfInterestWithRect:completionHandler:](self->_agent, "setRectOfInterestWithRect:completionHandler:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)selectSubjectAt:(CGPoint)a3 completion:(id)a4
{
  -[ObjectTrackingAgent selectSubjectAtPoint:completionHandler:](self->_agent, "selectSubjectAtPoint:completionHandler:", a4, a3.x, a3.y);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isButtonEnabledSemaphore, 0);
  objc_storeStrong((id *)&self->_isTrackingSemaphore, 0);
  objc_storeStrong((id *)&self->_agent, 0);
}

@end
