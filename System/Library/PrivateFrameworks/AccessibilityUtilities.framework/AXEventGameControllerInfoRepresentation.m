@implementation AXEventGameControllerInfoRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXEventGameControllerInfoRepresentation)initWithCoder:(id)a3
{
  id v4;
  AXEventGameControllerInfoRepresentation *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AXEventGameControllerInfoRepresentation;
  v5 = -[AXEventGameControllerInfoRepresentation init](&v7, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("directionPadUp"));
    -[AXEventGameControllerInfoRepresentation setDirectionPadUp:](v5, "setDirectionPadUp:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("directionPadDown"));
    -[AXEventGameControllerInfoRepresentation setDirectionPadDown:](v5, "setDirectionPadDown:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("directionPadLeft"));
    -[AXEventGameControllerInfoRepresentation setDirectionPadLeft:](v5, "setDirectionPadLeft:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("directionPadRight"));
    -[AXEventGameControllerInfoRepresentation setDirectionPadRight:](v5, "setDirectionPadRight:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("faceButtonA"));
    -[AXEventGameControllerInfoRepresentation setFaceButtonA:](v5, "setFaceButtonA:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("faceButtonB"));
    -[AXEventGameControllerInfoRepresentation setFaceButtonB:](v5, "setFaceButtonB:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("faceButtonX"));
    -[AXEventGameControllerInfoRepresentation setFaceButtonX:](v5, "setFaceButtonX:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("faceButtonY"));
    -[AXEventGameControllerInfoRepresentation setFaceButtonY:](v5, "setFaceButtonY:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("shoulderButtonL1"));
    -[AXEventGameControllerInfoRepresentation setShoulderButtonL1:](v5, "setShoulderButtonL1:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("shoulderButtonL2"));
    -[AXEventGameControllerInfoRepresentation setShoulderButtonL2:](v5, "setShoulderButtonL2:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("shoulderButtonR1"));
    -[AXEventGameControllerInfoRepresentation setShoulderButtonR1:](v5, "setShoulderButtonR1:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("shoulderButtonR2"));
    -[AXEventGameControllerInfoRepresentation setShoulderButtonR2:](v5, "setShoulderButtonR2:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("leftJoystickX"));
    -[AXEventGameControllerInfoRepresentation setLeftJoystickX:](v5, "setLeftJoystickX:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("leftJoystickY"));
    -[AXEventGameControllerInfoRepresentation setLeftJoystickY:](v5, "setLeftJoystickY:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("leftJoystickButton"));
    -[AXEventGameControllerInfoRepresentation setLeftJoystickButton:](v5, "setLeftJoystickButton:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rightJoystickX"));
    -[AXEventGameControllerInfoRepresentation setRightJoystickX:](v5, "setRightJoystickX:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rightJoystickY"));
    -[AXEventGameControllerInfoRepresentation setRightJoystickY:](v5, "setRightJoystickY:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rightJoystickButton"));
    -[AXEventGameControllerInfoRepresentation setRightJoystickButton:](v5, "setRightJoystickButton:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("menuButton"));
    -[AXEventGameControllerInfoRepresentation setMenuButton:](v5, "setMenuButton:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("viewButton"));
    -[AXEventGameControllerInfoRepresentation setViewButton:](v5, "setViewButton:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("homeButton"));
    -[AXEventGameControllerInfoRepresentation setHomeButton:](v5, "setHomeButton:");
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AXEventGameControllerInfoRepresentation *v4;

  v4 = objc_alloc_init(AXEventGameControllerInfoRepresentation);
  -[AXEventGameControllerInfoRepresentation directionPadUp](self, "directionPadUp");
  -[AXEventGameControllerInfoRepresentation setDirectionPadUp:](v4, "setDirectionPadUp:");
  -[AXEventGameControllerInfoRepresentation directionPadDown](self, "directionPadDown");
  -[AXEventGameControllerInfoRepresentation setDirectionPadDown:](v4, "setDirectionPadDown:");
  -[AXEventGameControllerInfoRepresentation directionPadLeft](self, "directionPadLeft");
  -[AXEventGameControllerInfoRepresentation setDirectionPadLeft:](v4, "setDirectionPadLeft:");
  -[AXEventGameControllerInfoRepresentation directionPadRight](self, "directionPadRight");
  -[AXEventGameControllerInfoRepresentation setDirectionPadRight:](v4, "setDirectionPadRight:");
  -[AXEventGameControllerInfoRepresentation faceButtonA](self, "faceButtonA");
  -[AXEventGameControllerInfoRepresentation setFaceButtonA:](v4, "setFaceButtonA:");
  -[AXEventGameControllerInfoRepresentation faceButtonB](self, "faceButtonB");
  -[AXEventGameControllerInfoRepresentation setFaceButtonB:](v4, "setFaceButtonB:");
  -[AXEventGameControllerInfoRepresentation faceButtonX](self, "faceButtonX");
  -[AXEventGameControllerInfoRepresentation setFaceButtonX:](v4, "setFaceButtonX:");
  -[AXEventGameControllerInfoRepresentation faceButtonY](self, "faceButtonY");
  -[AXEventGameControllerInfoRepresentation setFaceButtonY:](v4, "setFaceButtonY:");
  -[AXEventGameControllerInfoRepresentation shoulderButtonL1](self, "shoulderButtonL1");
  -[AXEventGameControllerInfoRepresentation setShoulderButtonL1:](v4, "setShoulderButtonL1:");
  -[AXEventGameControllerInfoRepresentation shoulderButtonL2](self, "shoulderButtonL2");
  -[AXEventGameControllerInfoRepresentation setShoulderButtonL2:](v4, "setShoulderButtonL2:");
  -[AXEventGameControllerInfoRepresentation shoulderButtonR1](self, "shoulderButtonR1");
  -[AXEventGameControllerInfoRepresentation setShoulderButtonR1:](v4, "setShoulderButtonR1:");
  -[AXEventGameControllerInfoRepresentation shoulderButtonR2](self, "shoulderButtonR2");
  -[AXEventGameControllerInfoRepresentation setShoulderButtonR2:](v4, "setShoulderButtonR2:");
  -[AXEventGameControllerInfoRepresentation leftJoystickX](self, "leftJoystickX");
  -[AXEventGameControllerInfoRepresentation setLeftJoystickX:](v4, "setLeftJoystickX:");
  -[AXEventGameControllerInfoRepresentation leftJoystickY](self, "leftJoystickY");
  -[AXEventGameControllerInfoRepresentation setLeftJoystickY:](v4, "setLeftJoystickY:");
  -[AXEventGameControllerInfoRepresentation leftJoystickButton](self, "leftJoystickButton");
  -[AXEventGameControllerInfoRepresentation setLeftJoystickButton:](v4, "setLeftJoystickButton:");
  -[AXEventGameControllerInfoRepresentation rightJoystickX](self, "rightJoystickX");
  -[AXEventGameControllerInfoRepresentation setRightJoystickX:](v4, "setRightJoystickX:");
  -[AXEventGameControllerInfoRepresentation rightJoystickY](self, "rightJoystickY");
  -[AXEventGameControllerInfoRepresentation setRightJoystickY:](v4, "setRightJoystickY:");
  -[AXEventGameControllerInfoRepresentation rightJoystickButton](self, "rightJoystickButton");
  -[AXEventGameControllerInfoRepresentation setRightJoystickButton:](v4, "setRightJoystickButton:");
  -[AXEventGameControllerInfoRepresentation menuButton](self, "menuButton");
  -[AXEventGameControllerInfoRepresentation setMenuButton:](v4, "setMenuButton:");
  -[AXEventGameControllerInfoRepresentation viewButton](self, "viewButton");
  -[AXEventGameControllerInfoRepresentation setViewButton:](v4, "setViewButton:");
  -[AXEventGameControllerInfoRepresentation homeButton](self, "homeButton");
  -[AXEventGameControllerInfoRepresentation setHomeButton:](v4, "setHomeButton:");
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[AXEventGameControllerInfoRepresentation directionPadUp](self, "directionPadUp");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("directionPadUp"));
  -[AXEventGameControllerInfoRepresentation directionPadDown](self, "directionPadDown");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("directionPadDown"));
  -[AXEventGameControllerInfoRepresentation directionPadLeft](self, "directionPadLeft");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("directionPadLeft"));
  -[AXEventGameControllerInfoRepresentation directionPadRight](self, "directionPadRight");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("directionPadRight"));
  -[AXEventGameControllerInfoRepresentation faceButtonA](self, "faceButtonA");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("faceButtonA"));
  -[AXEventGameControllerInfoRepresentation faceButtonB](self, "faceButtonB");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("faceButtonB"));
  -[AXEventGameControllerInfoRepresentation faceButtonX](self, "faceButtonX");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("faceButtonX"));
  -[AXEventGameControllerInfoRepresentation faceButtonY](self, "faceButtonY");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("faceButtonY"));
  -[AXEventGameControllerInfoRepresentation shoulderButtonL1](self, "shoulderButtonL1");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("shoulderButtonL1"));
  -[AXEventGameControllerInfoRepresentation shoulderButtonL2](self, "shoulderButtonL2");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("shoulderButtonL2"));
  -[AXEventGameControllerInfoRepresentation shoulderButtonR1](self, "shoulderButtonR1");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("shoulderButtonR1"));
  -[AXEventGameControllerInfoRepresentation shoulderButtonR2](self, "shoulderButtonR2");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("shoulderButtonR2"));
  -[AXEventGameControllerInfoRepresentation leftJoystickX](self, "leftJoystickX");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("leftJoystickX"));
  -[AXEventGameControllerInfoRepresentation leftJoystickY](self, "leftJoystickY");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("leftJoystickY"));
  -[AXEventGameControllerInfoRepresentation leftJoystickButton](self, "leftJoystickButton");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("leftJoystickButton"));
  -[AXEventGameControllerInfoRepresentation rightJoystickX](self, "rightJoystickX");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("rightJoystickX"));
  -[AXEventGameControllerInfoRepresentation rightJoystickY](self, "rightJoystickY");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("rightJoystickY"));
  -[AXEventGameControllerInfoRepresentation rightJoystickButton](self, "rightJoystickButton");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("rightJoystickButton"));
  -[AXEventGameControllerInfoRepresentation rightJoystickButton](self, "rightJoystickButton");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("menuButton"));
  -[AXEventGameControllerInfoRepresentation rightJoystickButton](self, "rightJoystickButton");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("viewButton"));
  -[AXEventGameControllerInfoRepresentation rightJoystickButton](self, "rightJoystickButton");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("homeButton"));

}

- (id)accessibilityEventRepresentationTabularDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXEventGameControllerInfoRepresentation directionPadUp](self, "directionPadUp");
  v45 = v4;
  -[AXEventGameControllerInfoRepresentation directionPadDown](self, "directionPadDown");
  v44 = v5;
  -[AXEventGameControllerInfoRepresentation directionPadLeft](self, "directionPadLeft");
  v43 = v6;
  -[AXEventGameControllerInfoRepresentation directionPadRight](self, "directionPadRight");
  v42 = v7;
  -[AXEventGameControllerInfoRepresentation leftJoystickX](self, "leftJoystickX");
  v41 = v8;
  -[AXEventGameControllerInfoRepresentation leftJoystickY](self, "leftJoystickY");
  v40 = v9;
  -[AXEventGameControllerInfoRepresentation rightJoystickX](self, "rightJoystickX");
  v39 = v10;
  -[AXEventGameControllerInfoRepresentation rightJoystickY](self, "rightJoystickY");
  v38 = v11;
  -[AXEventGameControllerInfoRepresentation faceButtonA](self, "faceButtonA");
  v37 = v12;
  -[AXEventGameControllerInfoRepresentation faceButtonB](self, "faceButtonB");
  v36 = v13;
  -[AXEventGameControllerInfoRepresentation faceButtonX](self, "faceButtonX");
  v35 = v14;
  -[AXEventGameControllerInfoRepresentation faceButtonY](self, "faceButtonY");
  v34 = v15;
  -[AXEventGameControllerInfoRepresentation shoulderButtonL1](self, "shoulderButtonL1");
  v17 = v16;
  -[AXEventGameControllerInfoRepresentation shoulderButtonL2](self, "shoulderButtonL2");
  v19 = v18;
  -[AXEventGameControllerInfoRepresentation shoulderButtonR1](self, "shoulderButtonR1");
  v21 = v20;
  -[AXEventGameControllerInfoRepresentation shoulderButtonR2](self, "shoulderButtonR2");
  v23 = v22;
  -[AXEventGameControllerInfoRepresentation leftJoystickButton](self, "leftJoystickButton");
  v25 = v24;
  -[AXEventGameControllerInfoRepresentation rightJoystickButton](self, "rightJoystickButton");
  v27 = v26;
  -[AXEventGameControllerInfoRepresentation menuButton](self, "menuButton");
  v29 = v28;
  -[AXEventGameControllerInfoRepresentation viewButton](self, "viewButton");
  v31 = v30;
  -[AXEventGameControllerInfoRepresentation homeButton](self, "homeButton");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR(" Game Info:\n   D-pad Up: %.2f\n   D-pad Down: %.2f\n   D-pad Left: %.2f\n   D-pad Right: %.2f\n   Left Stick X: %.2f\n   Left Stick Y: %.2f\n   Right Stick X: %.2f\n   Right Stick Y: %.2f\n   A: %.2f\n   B: %.2f\n   X: %.2f\n   Y: %.2f\n   L1: %.2f\n   L2: %.2f\n   R1: %.2f\n   R2: %.2f\n   Left Stick Button: %.2f\n   Right Stick Button: %.2f\n   Menu Button: %.2f\n   View Button: %.2f\n   Home Button: %.2f\n"), v45, v44, v43, v42, v41, v40, v39, v38, v37, v36, v35, v34, v17, v19, v21, v23,
               v25,
               v27,
               v29,
               v31,
               v32);
}

- (BOOL)rightJoystickActive
{
  return self->_rightJoystickX != 0.0 || self->_rightJoystickY != 0.0;
}

- (BOOL)leftJoystickActive
{
  return self->_leftJoystickX != 0.0 || self->_leftJoystickY != 0.0;
}

- (BOOL)isJoystickPressed
{
  return self->_leftJoystickButton != 0.0 || self->_rightJoystickButton != 0.0;
}

- (BOOL)isDirectionPadPressed
{
  return self->_directionPadUp != 0.0
      || self->_directionPadDown != 0.0
      || self->_directionPadLeft != 0.0
      || self->_directionPadRight != 0.0;
}

- (BOOL)isFaceButtonPressed
{
  return self->_faceButtonA != 0.0
      || self->_faceButtonB != 0.0
      || self->_faceButtonX != 0.0
      || self->_faceButtonY != 0.0;
}

- (BOOL)isShoulderButtonPressed
{
  return self->_shoulderButtonL1 != 0.0
      || self->_shoulderButtonL2 != 0.0
      || self->_shoulderButtonR1 != 0.0
      || self->_shoulderButtonR2 != 0.0;
}

- (BOOL)isKeyboardTypeButtonPressed
{
  return self->_menuButton != 0.0 || self->_viewButton != 0.0 || self->_homeButton != 0.0;
}

- (double)directionPadUp
{
  return self->_directionPadUp;
}

- (void)setDirectionPadUp:(double)a3
{
  self->_directionPadUp = a3;
}

- (double)directionPadDown
{
  return self->_directionPadDown;
}

- (void)setDirectionPadDown:(double)a3
{
  self->_directionPadDown = a3;
}

- (double)directionPadLeft
{
  return self->_directionPadLeft;
}

- (void)setDirectionPadLeft:(double)a3
{
  self->_directionPadLeft = a3;
}

- (double)directionPadRight
{
  return self->_directionPadRight;
}

- (void)setDirectionPadRight:(double)a3
{
  self->_directionPadRight = a3;
}

- (double)faceButtonA
{
  return self->_faceButtonA;
}

- (void)setFaceButtonA:(double)a3
{
  self->_faceButtonA = a3;
}

- (double)faceButtonB
{
  return self->_faceButtonB;
}

- (void)setFaceButtonB:(double)a3
{
  self->_faceButtonB = a3;
}

- (double)faceButtonX
{
  return self->_faceButtonX;
}

- (void)setFaceButtonX:(double)a3
{
  self->_faceButtonX = a3;
}

- (double)faceButtonY
{
  return self->_faceButtonY;
}

- (void)setFaceButtonY:(double)a3
{
  self->_faceButtonY = a3;
}

- (double)shoulderButtonR1
{
  return self->_shoulderButtonR1;
}

- (void)setShoulderButtonR1:(double)a3
{
  self->_shoulderButtonR1 = a3;
}

- (double)shoulderButtonR2
{
  return self->_shoulderButtonR2;
}

- (void)setShoulderButtonR2:(double)a3
{
  self->_shoulderButtonR2 = a3;
}

- (double)shoulderButtonL1
{
  return self->_shoulderButtonL1;
}

- (void)setShoulderButtonL1:(double)a3
{
  self->_shoulderButtonL1 = a3;
}

- (double)shoulderButtonL2
{
  return self->_shoulderButtonL2;
}

- (void)setShoulderButtonL2:(double)a3
{
  self->_shoulderButtonL2 = a3;
}

- (double)leftJoystickX
{
  return self->_leftJoystickX;
}

- (void)setLeftJoystickX:(double)a3
{
  self->_leftJoystickX = a3;
}

- (double)leftJoystickY
{
  return self->_leftJoystickY;
}

- (void)setLeftJoystickY:(double)a3
{
  self->_leftJoystickY = a3;
}

- (double)leftJoystickButton
{
  return self->_leftJoystickButton;
}

- (void)setLeftJoystickButton:(double)a3
{
  self->_leftJoystickButton = a3;
}

- (double)rightJoystickX
{
  return self->_rightJoystickX;
}

- (void)setRightJoystickX:(double)a3
{
  self->_rightJoystickX = a3;
}

- (double)rightJoystickY
{
  return self->_rightJoystickY;
}

- (void)setRightJoystickY:(double)a3
{
  self->_rightJoystickY = a3;
}

- (double)rightJoystickButton
{
  return self->_rightJoystickButton;
}

- (void)setRightJoystickButton:(double)a3
{
  self->_rightJoystickButton = a3;
}

- (double)menuButton
{
  return self->_menuButton;
}

- (void)setMenuButton:(double)a3
{
  self->_menuButton = a3;
}

- (double)viewButton
{
  return self->_viewButton;
}

- (void)setViewButton:(double)a3
{
  self->_viewButton = a3;
}

- (double)homeButton
{
  return self->_homeButton;
}

- (void)setHomeButton:(double)a3
{
  self->_homeButton = a3;
}

@end
