@implementation BWStillImageTurnstileNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWStillImageTurnstileNode)initWithStillImageCoordinator:(id)a3
{
  BWStillImageTurnstileNode *v4;
  BWNodeInput *v5;
  BWVideoFormatRequirements *v6;
  BWNodeOutput *v7;
  BWVideoFormatRequirements *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BWStillImageTurnstileNode;
  v4 = -[BWNode init](&v10, sel_init);
  if (v4)
  {
    v4->_stillImageCoordinator = (BWStillImageCoordinatorNode *)a3;
    v5 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v4);
    v6 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeInput setFormatRequirements:](v5, "setFormatRequirements:", v6);

    -[BWNodeInput setPassthroughMode:](v5, "setPassthroughMode:", 1);
    -[BWNode addInput:](v4, "addInput:", v5);

    v7 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v4);
    v8 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeOutput setFormatRequirements:](v7, "setFormatRequirements:", v8);
    -[BWNodeOutput setPassthroughMode:](v7, "setPassthroughMode:", 1);

    -[BWNode addOutput:](v4, "addOutput:", v7);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageTurnstileNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("StillImageTurnstile");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3, a4);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  -[BWStillImageCoordinatorNode clientReceivedPayloadForSettings:status:clientIsMidStillImageGraph:](self->_stillImageCoordinator, "clientReceivedPayloadForSettings:status:clientIsMidStillImageGraph:", CMGetAttachment(a3, CFSTR("StillImageSettings"), 0), 0, 1);
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  -[BWStillImageCoordinatorNode clientReceivedPayloadForSettings:status:clientIsMidStillImageGraph:](self->_stillImageCoordinator, "clientReceivedPayloadForSettings:status:clientIsMidStillImageGraph:", objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "requestedSettings"), objc_msgSend(a3, "errorCode"), 1);
  -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", a3);
}

@end
