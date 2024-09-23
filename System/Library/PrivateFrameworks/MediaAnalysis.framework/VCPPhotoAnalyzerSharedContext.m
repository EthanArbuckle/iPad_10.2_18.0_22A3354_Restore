@implementation VCPPhotoAnalyzerSharedContext

- (id)_init
{
  VCPPhotoAnalyzerSharedContext *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queueDecode;
  dispatch_queue_t v6;
  OS_dispatch_queue *queueBlur;
  dispatch_queue_t v8;
  OS_dispatch_queue *queueDescriptor;
  dispatch_queue_t v10;
  OS_dispatch_queue *queueExposure;
  dispatch_queue_t v12;
  OS_dispatch_queue *queueFace;
  dispatch_queue_t v14;
  OS_dispatch_queue *queueHumanAction;
  dispatch_queue_t v16;
  OS_dispatch_queue *queueHumanPose;
  dispatch_queue_t v18;
  OS_dispatch_queue *queueBackbone;
  dispatch_queue_t v20;
  OS_dispatch_queue *queueCaption;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)VCPPhotoAnalyzerSharedContext;
  v2 = -[VCPPhotoAnalyzerSharedContext init](&v23, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("VCPPhotoAnalyzer.decode", v3);
    queueDecode = v2->_queueDecode;
    v2->_queueDecode = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_create("VCPPhotoAnalyzer.blur", v3);
    queueBlur = v2->_queueBlur;
    v2->_queueBlur = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_create("VCPPhotoAnalyzer.descriptor", v3);
    queueDescriptor = v2->_queueDescriptor;
    v2->_queueDescriptor = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("VCPPhotoAnalyzer.exposure", v3);
    queueExposure = v2->_queueExposure;
    v2->_queueExposure = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("VCPPhotoAnalyzer.face", v3);
    queueFace = v2->_queueFace;
    v2->_queueFace = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_create("VCPPhotoAnalyzer.humanAction", v3);
    queueHumanAction = v2->_queueHumanAction;
    v2->_queueHumanAction = (OS_dispatch_queue *)v14;

    v16 = dispatch_queue_create("VCPPhotoAnalyzer.humanPose", v3);
    queueHumanPose = v2->_queueHumanPose;
    v2->_queueHumanPose = (OS_dispatch_queue *)v16;

    v18 = dispatch_queue_create("VCPPhotoAnalyzer.backbone", v3);
    queueBackbone = v2->_queueBackbone;
    v2->_queueBackbone = (OS_dispatch_queue *)v18;

    v20 = dispatch_queue_create("VCPPhotoAnalyzer.caption", v3);
    queueCaption = v2->_queueCaption;
    v2->_queueCaption = (OS_dispatch_queue *)v20;

  }
  return v2;
}

+ (id)sharedContext
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedInstanceWithIdentifier:andCreationBlock:", v4, &__block_literal_global_87);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __46__VCPPhotoAnalyzerSharedContext_sharedContext__block_invoke()
{
  return -[VCPPhotoAnalyzerSharedContext _init]([VCPPhotoAnalyzerSharedContext alloc], "_init");
}

- (OS_dispatch_queue)queueDecode
{
  return self->_queueDecode;
}

- (OS_dispatch_queue)queueBlur
{
  return self->_queueBlur;
}

- (OS_dispatch_queue)queueDescriptor
{
  return self->_queueDescriptor;
}

- (OS_dispatch_queue)queueExposure
{
  return self->_queueExposure;
}

- (OS_dispatch_queue)queueFace
{
  return self->_queueFace;
}

- (OS_dispatch_queue)queueHumanAction
{
  return self->_queueHumanAction;
}

- (OS_dispatch_queue)queueHumanPose
{
  return self->_queueHumanPose;
}

- (OS_dispatch_queue)queueBackbone
{
  return self->_queueBackbone;
}

- (OS_dispatch_queue)queueCaption
{
  return self->_queueCaption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueCaption, 0);
  objc_storeStrong((id *)&self->_queueBackbone, 0);
  objc_storeStrong((id *)&self->_queueHumanPose, 0);
  objc_storeStrong((id *)&self->_queueHumanAction, 0);
  objc_storeStrong((id *)&self->_queueFace, 0);
  objc_storeStrong((id *)&self->_queueExposure, 0);
  objc_storeStrong((id *)&self->_queueDescriptor, 0);
  objc_storeStrong((id *)&self->_queueBlur, 0);
  objc_storeStrong((id *)&self->_queueDecode, 0);
}

@end
