@implementation SCNAction

+ (void)setEditingModeEnabled:(BOOL)a3
{
  C3DSetIsRunningInEditor(a3);
}

- (SCNActionTimingFunction)timingFunction
{
  return self->_caction->var2;
}

- (void)setTimingFunction:(SCNActionTimingFunction)timingFunction
{
  id var2;

  var2 = self->_caction->var2;
  if (var2 != timingFunction)
  {
    if (var2)
    {
      _Block_release(var2);
      self->_caction->var2 = 0;
    }
    if (timingFunction)
      self->_caction->var2 = _Block_copy(timingFunction);
  }
}

- (SCNCAction)caction
{
  return self->_caction;
}

- (NSTimeInterval)duration
{
  return self->_caction->var7;
}

- (void)setDuration:(NSTimeInterval)duration
{
  self->_caction->var7 = duration;
}

- (double)durationRange
{
  return self->_caction->var8;
}

- (void)setDurationRange:(double)a3
{
  self->_caction->var8 = a3;
}

- (SCNActionTimingMode)timingMode
{
  return self->_caction->var14;
}

- (void)setTimingMode:(SCNActionTimingMode)timingMode
{
  self->_caction->var14 = timingMode;
}

- (BOOL)isCustom
{
  return 0;
}

- (BOOL)isRelative
{
  return 0;
}

- (id)parameters
{
  return 0;
}

- (SCNAction)init
{
  SCNAction *v2;
  SCNCAction *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNAction;
  v2 = -[SCNAction init](&v5, sel_init);
  if (v2)
  {
    v3 = (SCNCAction *)operator new();
    SCNCAction::SCNCAction(v3);
    -[SCNAction setCppAction:](v2, "setCppAction:", v3);
  }
  return v2;
}

- (SCNAction)initWithCoder:(id)a3
{
  SCNAction *v4;
  SCNCAction *v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNAction;
  v4 = -[SCNAction init](&v8, sel_init);
  if (v4)
  {
    v5 = (SCNCAction *)operator new();
    SCNCAction::SCNCAction(v5);
    -[SCNAction setCppAction:](v4, "setCppAction:", v5);
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_duration")), "doubleValue");
    v4->_caction->var7 = v6;
    v4->_caction->var14 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_timingMode")), "integerValue");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  __CFString *var13;

  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_caction->var7), CFSTR("_duration"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_caction->var14), CFSTR("_timingMode"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_caction->var5), CFSTR("_beginTime"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_caction->var6), CFSTR("_pausedTime"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_caction->var11), CFSTR("_isRunning"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_caction->var10), CFSTR("_finished"));
  var13 = self->_caction->var13;
  objc_opt_class();
  SCNEncodeNamedObject(a3, (const char *)var13);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setSpeed:(CGFloat)speed
{
  (*((void (**)(SCNCAction *, CGFloat))self->_caction->var0 + 6))(self->_caction, speed);
}

- (CGFloat)speed
{
  return self->_caction->var17;
}

- (id)copy
{
  return -[SCNAction copyWithZone:](self, "copyWithZone:", MEMORY[0x1DF0D3F5C](self, a2));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  SCNCAction *caction;
  id var2;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = objc_msgSend(v4, "caction");
  caction = self->_caction;
  *(_QWORD *)(v5 + 104) = caction->var14;
  *(_OWORD *)(v5 + 120) = *(_OWORD *)&caction->var16;
  *(double *)(v5 + 136) = caction->var18;
  *(_WORD *)(v5 + 80) = 0;
  *(_OWORD *)(v5 + 56) = *(_OWORD *)&caction->var7;
  var2 = caction->var2;
  if (var2)
    *(_QWORD *)(v5 + 16) = _Block_copy(var2);
  return v4;
}

- (SCNAction)reversedAction
{
  return (SCNAction *)-[SCNAction copy](self, "copy");
}

- (void)dealloc
{
  SCNCAction *caction;
  objc_super v4;

  caction = self->_caction;
  if (caction)
  {
    caction->var3 = 0;
    (*((void (**)(SCNCAction *, SEL))caction->var0 + 1))(caction, a2);
    self->_caction = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNAction;
  -[SCNAction dealloc](&v4, sel_dealloc);
}

+ (SCNAction)moveByX:(CGFloat)deltaX y:(CGFloat)deltaY z:(CGFloat)deltaZ duration:(NSTimeInterval)duration
{
  return (SCNAction *)+[SCNActionMove moveByX:y:z:duration:](SCNActionMove, "moveByX:y:z:duration:", deltaX, deltaY, deltaZ, duration);
}

+ (SCNAction)moveBy:(SCNVector3)delta duration:(NSTimeInterval)duration
{
  return (SCNAction *)+[SCNActionMove moveByX:y:z:duration:](SCNActionMove, "moveByX:y:z:duration:", delta.x, delta.y, delta.z, duration);
}

+ (SCNAction)moveTo:(SCNVector3)location duration:(NSTimeInterval)duration
{
  return (SCNAction *)+[SCNActionMove moveToX:y:z:duration:](SCNActionMove, "moveToX:y:z:duration:", location.x, location.y, location.z, duration);
}

+ (SCNAction)rotateByX:(CGFloat)xAngle y:(CGFloat)yAngle z:(CGFloat)zAngle duration:(NSTimeInterval)duration
{
  return (SCNAction *)+[SCNActionRotate rotateByX:y:z:duration:](SCNActionRotate, "rotateByX:y:z:duration:", xAngle, yAngle, zAngle, duration);
}

+ (SCNAction)rotateToX:(CGFloat)xAngle y:(CGFloat)yAngle z:(CGFloat)zAngle duration:(NSTimeInterval)duration
{
  return (SCNAction *)+[SCNActionRotate rotateToX:y:z:duration:](SCNActionRotate, "rotateToX:y:z:duration:", xAngle, yAngle, zAngle, duration);
}

+ (SCNAction)rotateByAngle:(CGFloat)angle aroundAxis:(SCNVector3)axis duration:(NSTimeInterval)duration
{
  return (SCNAction *)+[SCNActionRotate rotateByAngle:aroundAxis:duration:](SCNActionRotate, "rotateByAngle:aroundAxis:duration:", angle, *(double *)&axis.x, *(double *)&axis.y, *(double *)&axis.z, duration);
}

+ (SCNAction)rotateToAxisAngle:(SCNVector4)axisAngle duration:(NSTimeInterval)duration
{
  return (SCNAction *)+[SCNActionRotate rotateToAxisAngle:duration:](SCNActionRotate, "rotateToAxisAngle:duration:", *(double *)&axisAngle.x, *(double *)&axisAngle.y, *(double *)&axisAngle.z, *(double *)&axisAngle.w, duration);
}

+ (SCNAction)rotateToX:(CGFloat)xAngle y:(CGFloat)yAngle z:(CGFloat)zAngle duration:(NSTimeInterval)duration shortestUnitArc:(BOOL)shortestUnitArc
{
  return (SCNAction *)+[SCNActionRotate rotateToX:y:z:duration:shortestUnitArc:](SCNActionRotate, "rotateToX:y:z:duration:shortestUnitArc:", shortestUnitArc, xAngle, yAngle, zAngle, duration);
}

+ (SCNAction)scaleBy:(CGFloat)scale duration:(NSTimeInterval)sec
{
  return (SCNAction *)+[SCNActionScale scaleBy:duration:](SCNActionScale, "scaleBy:duration:", scale, sec);
}

+ (SCNAction)scaleTo:(CGFloat)scale duration:(NSTimeInterval)sec
{
  return (SCNAction *)+[SCNActionScale scaleTo:duration:](SCNActionScale, "scaleTo:duration:", scale, sec);
}

+ (SCNAction)sequence:(NSArray *)actions
{
  return (SCNAction *)+[SCNActionSequence sequenceWithActions:](SCNActionSequence, "sequenceWithActions:", actions);
}

+ (SCNAction)group:(NSArray *)actions
{
  return (SCNAction *)+[SCNActionGroup groupWithActions:](SCNActionGroup, "groupWithActions:", actions);
}

+ (SCNAction)repeatAction:(SCNAction *)action count:(NSUInteger)count
{
  return (SCNAction *)+[SCNActionRepeat repeatAction:count:](SCNActionRepeat, "repeatAction:count:", action, count);
}

+ (SCNAction)repeatActionForever:(SCNAction *)action
{
  return (SCNAction *)+[SCNActionRepeat repeatActionForever:](SCNActionRepeat, "repeatActionForever:", action);
}

+ (SCNAction)fadeInWithDuration:(NSTimeInterval)sec
{
  return (SCNAction *)+[SCNActionFade fadeInWithDuration:](SCNActionFade, "fadeInWithDuration:", sec);
}

+ (SCNAction)fadeOutWithDuration:(NSTimeInterval)sec
{
  return (SCNAction *)+[SCNActionFade fadeOutWithDuration:](SCNActionFade, "fadeOutWithDuration:", sec);
}

+ (SCNAction)fadeOpacityBy:(CGFloat)factor duration:(NSTimeInterval)sec
{
  return (SCNAction *)+[SCNActionFade fadeOpacityBy:duration:](SCNActionFade, "fadeOpacityBy:duration:", factor, sec);
}

+ (SCNAction)fadeOpacityTo:(CGFloat)opacity duration:(NSTimeInterval)sec
{
  return (SCNAction *)+[SCNActionFade fadeOpacityTo:duration:](SCNActionFade, "fadeOpacityTo:duration:", opacity, sec);
}

+ (SCNAction)hide
{
  return (SCNAction *)+[SCNActionHide hide](SCNActionHide, "hide");
}

+ (SCNAction)unhide
{
  return (SCNAction *)+[SCNActionHide unhide](SCNActionHide, "unhide");
}

+ (SCNAction)playAudioSource:(SCNAudioSource *)source waitForCompletion:(BOOL)wait
{
  return (SCNAction *)+[SCNActionPlaySound playAudioSource:waitForCompletion:](SCNActionPlaySound, "playAudioSource:waitForCompletion:", source, wait);
}

+ (SCNAction)waitForDuration:(NSTimeInterval)sec
{
  return (SCNAction *)+[SCNActionWait waitForDuration:](SCNActionWait, "waitForDuration:", sec);
}

+ (SCNAction)waitForDuration:(NSTimeInterval)sec withRange:(NSTimeInterval)durationRange
{
  return (SCNAction *)+[SCNActionWait waitForDuration:withRange:](SCNActionWait, "waitForDuration:withRange:", sec, durationRange);
}

+ (SCNAction)removeFromParentNode
{
  return (SCNAction *)+[SCNActionRemove removeFromParentNode](SCNActionRemove, "removeFromParentNode");
}

+ (id)performSelector:(SEL)a3 onTarget:(id)a4
{
  return +[SCNActionPerformSelector performSelector:onTarget:](SCNActionPerformSelector, "performSelector:onTarget:", a3, a4);
}

+ (SCNAction)runBlock:(void *)block
{
  return (SCNAction *)+[SCNActionRunBlock runBlock:queue:](SCNActionRunBlock, "runBlock:queue:", block, 0);
}

+ (SCNAction)runBlock:(void *)block queue:(dispatch_queue_t)queue
{
  return (SCNAction *)+[SCNActionRunBlock runBlock:queue:](SCNActionRunBlock, "runBlock:queue:", block, queue);
}

+ (id)runAction:(id)a3 onChildNodeWithName:(id)a4
{
  return +[SCNActionRunAction runAction:onFirstChildWithName:](SCNActionRunAction, "runAction:onFirstChildWithName:", a3, a4);
}

+ (SCNAction)javaScriptActionWithScript:(NSString *)script duration:(NSTimeInterval)seconds
{
  return (SCNAction *)+[SCNActionJavaScript javaScriptActionWithDuration:script:](SCNActionJavaScript, "javaScriptActionWithDuration:script:", script, seconds);
}

+ (SCNAction)customActionWithDuration:(NSTimeInterval)seconds actionBlock:(void *)block
{
  return (SCNAction *)+[SCNActionCustom customActionWithDuration:actionBlock:](SCNActionCustom, "customActionWithDuration:actionBlock:", block, seconds);
}

+ (id)actionNamed:(id)a3
{
  return +[SCNAssetCatalog objectWithName:class:](SCNAssetCatalog, "objectWithName:class:", a3, objc_opt_class());
}

- (void)setCppAction:(void *)a3
{
  SCNCAction *caction;

  caction = self->_caction;
  if (caction)
    (*((void (**)(SCNCAction *, SEL))caction->var0 + 1))(caction, a2);
  self->_caction = (SCNCAction *)a3;
  *((_QWORD *)a3 + 3) = self;
}

- (void)wasPausedWithTarget:(id)a3 atTime:(double)a4
{
  self->_caction->var6 = a4;
}

- (void)willResumeWithTarget:(id)a3 atTime:(double)a4
{
  self->_caction->var5 = self->_caction->var5 + a4 - self->_caction->var6;
}

- (void)timeJumpWithTarget:(id)a3 timeOffset:(double)a4
{
  self->_caction->var5 = self->_caction->var5 + a4;
}

- (BOOL)finished
{
  return self->_caction->var10;
}

- (void)setFinished:(BOOL)a3
{
  self->_caction->var10 = a3;
}

- (double)ratioForTime:(double)a3
{
  double result;

  SCNCAction::ratioForTime(self->_caction, a3);
  return result;
}

- (void)wasAddedToTarget:(id)a3 atTime:(double)a4
{
  SCNCAction *caction;
  double var7;
  double var8;
  float v7;

  caction = self->_caction;
  caction->var10 = 0;
  var7 = caction->var7;
  var8 = caction->var8;
  v7 = var8;
  if ((LODWORD(v7) & 0x60000000) != 0)
  {
    var7 = var7 - var8 * 0.5 + (double)rand() / 2147483650.0 * (var8 + var7 - (var7 - var8));
    caction = self->_caction;
    if (var7 < 0.0)
      var7 = 0.0;
  }
  caction->var1 = var7;
}

- (void)wasRemovedFromTarget:(id)a3 atTime:(double)a4
{
  *(_WORD *)&self->_caction->var10 = 1;
}

- (void)willStartWithTarget:(id)a3 atTime:(double)a4
{
  SCNCAction *caction;

  caction = self->_caction;
  caction->var5 = a4;
  caction->var15 = 0.0;
  caction->var11 = 1;
}

- (void)updateWithTarget:(id)a3 forTime:(double)a4
{
  double v7;

  SCNCAction::ratioForTime(self->_caction, a4);
  if (v7 >= 1.0)
    SCNCAction::didFinishWithTargetAtTime(self->_caction, (SCNNode *)a3, a4);
}

- (void)setKey:(id)a3
{
  self->_caction->var13 = (__CFString *)a3;
}

- (void)setCompletionBlock:(id)a3
{
  self->_caction->var12 = _Block_copy(a3);
}

@end
