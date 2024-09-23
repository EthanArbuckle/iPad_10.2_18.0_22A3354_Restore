@implementation AXPageTurningReplayableGesture

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[AXPageTurningReplayableGesture isLeftToRightSwipe](self, "isLeftToRightSwipe"), CFSTR("IsLeftToRightSwipe"));

}

- (AXPageTurningReplayableGesture)initWithCoder:(id)a3
{
  return (AXPageTurningReplayableGesture *)-[AXPageTurningReplayableGesture initForLeftToRightSwipe:](self, "initForLeftToRightSwipe:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("IsLeftToRightSwipe")));
}

- (id)initForLeftToRightSwipe:(BOOL)a3
{
  _BOOL8 v3;
  AXPageTurningReplayableGesture *v4;
  AXPageTurningReplayableGesture *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AXPageTurningReplayableGesture;
  v4 = -[AXPageTurningReplayableGesture init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[AXPageTurningReplayableGesture setIsLeftToRightSwipe:](v4, "setIsLeftToRightSwipe:", v3);
  return v5;
}

- (unint64_t)numberOfEvents
{
  return 10;
}

- (id)fingerIdentifiersAtEventIndex:(unint64_t)a3
{
  return &unk_1E24F8E28;
}

- (double)timeAtEventIndex:(unint64_t)a3
{
  return (double)a3 * 0.0166666667;
}

- (CGPoint)pointForFingerIdentifier:(id)a3 atEventIndex:(unint64_t)a4
{
  double MainScreenBounds;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  _BOOL4 v13;
  CGFloat v14;
  CGFloat MidY;
  double v16;
  double v17;
  double v18;
  CGPoint result;
  CGRect v20;
  CGRect v21;

  MainScreenBounds = AXDeviceGetMainScreenBounds();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = -[AXPageTurningReplayableGesture isLandscape](self, "isLandscape");
  if (v13)
    v14 = v12;
  else
    v14 = v10;
  if (v13)
    v12 = v10;
  v20.origin.x = MainScreenBounds;
  v20.origin.y = v8;
  v20.size.width = v14;
  v20.size.height = v12;
  MidY = CGRectGetMidY(v20);
  v16 = (double)a4 * 20.0 + 50.0;
  if (!-[AXPageTurningReplayableGesture isLeftToRightSwipe](self, "isLeftToRightSwipe"))
  {
    v21.origin.x = MainScreenBounds;
    v21.origin.y = v8;
    v21.size.width = v14;
    v21.size.height = v12;
    v16 = CGRectGetMaxX(v21) - v16;
  }
  v17 = v16;
  v18 = MidY;
  result.y = v18;
  result.x = v17;
  return result;
}

- (double)forceForFingerIdentifier:(id)a3 atEventIndex:(unint64_t)a4
{
  return 0.0;
}

- (BOOL)arePointsDeviceRelative
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;

  v4 = (unsigned __int8 *)a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = *((unsigned __int8 *)&self->super._arePointsDeviceRelative + 1) == v4[17];
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash") + *((unsigned __int8 *)&self->super._arePointsDeviceRelative + 1);
}

- (BOOL)isLeftToRightSwipe
{
  return *(&self->super._arePointsDeviceRelative + 1);
}

- (void)setIsLeftToRightSwipe:(BOOL)a3
{
  *(&self->super._arePointsDeviceRelative + 1) = a3;
}

- (BOOL)isLandscape
{
  return *(&self->super._arePointsDeviceRelative + 2);
}

- (void)setIsLandscape:(BOOL)a3
{
  *(&self->super._arePointsDeviceRelative + 2) = a3;
}

@end
