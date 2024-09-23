@implementation AXGameControllerEvent

+ (unsigned)axGameControllerKeyCodeForEvent:(__IOHIDEvent *)a3
{
  uint64_t IntegerValue;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  IOHIDEventGetFloatMultiple();
  if (v5 != 0.0)
    return 1;
  if (v6 != 0.0)
    return 2;
  if (v7 != 0.0)
    return 3;
  if (v8 != 0.0)
    return 4;
  if (v9 != 0.0)
    return 5;
  if (v10 != 0.0)
    return 6;
  if (v11 != 0.0)
    return 7;
  if (v12 != 0.0)
    return 8;
  if (v13 != 0.0)
    return 9;
  if (v15 != 0.0)
    return 11;
  if (v14 != 0.0)
    return 10;
  if (v16 != 0.0)
    return 12;
  if (v17 != 0.0)
    return 13;
  if (v18 != 0.0)
    return 14;
  if (v19 != 0.0)
    return 15;
  if (v20 != 0.0)
    return 16;
  if (v21 != 0.0)
    return 17;
  if (v22 != 0.0)
    return 18;
  if (v23 == 0.0)
    return 0;
  IntegerValue = IOHIDEventGetIntegerValue();
  if (IntegerValue == 516)
    return 20;
  if (IntegerValue != 547)
  {
    if (IntegerValue == 521)
      return 21;
    return 0;
  }
  return 22;
}

+ (id)axGameControllerInfoRepresentationFromEvent:(__IOHIDEvent *)a3
{
  AXEventGameControllerInfoRepresentation *v3;
  uint64_t IntegerValue;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  IOHIDEventGetFloatMultiple();
  v3 = objc_alloc_init(AXEventGameControllerInfoRepresentation);
  -[AXEventGameControllerInfoRepresentation setDirectionPadUp:](v3, "setDirectionPadUp:", v6);
  -[AXEventGameControllerInfoRepresentation setDirectionPadDown:](v3, "setDirectionPadDown:", v7);
  -[AXEventGameControllerInfoRepresentation setDirectionPadLeft:](v3, "setDirectionPadLeft:", v8);
  -[AXEventGameControllerInfoRepresentation setDirectionPadRight:](v3, "setDirectionPadRight:", v9);
  -[AXEventGameControllerInfoRepresentation setFaceButtonA:](v3, "setFaceButtonA:", v10);
  -[AXEventGameControllerInfoRepresentation setFaceButtonB:](v3, "setFaceButtonB:", v11);
  -[AXEventGameControllerInfoRepresentation setFaceButtonX:](v3, "setFaceButtonX:", v12);
  -[AXEventGameControllerInfoRepresentation setFaceButtonY:](v3, "setFaceButtonY:", v13);
  -[AXEventGameControllerInfoRepresentation setShoulderButtonL1:](v3, "setShoulderButtonL1:", v14);
  -[AXEventGameControllerInfoRepresentation setShoulderButtonL2:](v3, "setShoulderButtonL2:", v16);
  -[AXEventGameControllerInfoRepresentation setShoulderButtonR1:](v3, "setShoulderButtonR1:", v15);
  -[AXEventGameControllerInfoRepresentation setShoulderButtonR2:](v3, "setShoulderButtonR2:", v17);
  -[AXEventGameControllerInfoRepresentation setLeftJoystickX:](v3, "setLeftJoystickX:", v18);
  -[AXEventGameControllerInfoRepresentation setLeftJoystickY:](v3, "setLeftJoystickY:", v19);
  -[AXEventGameControllerInfoRepresentation setRightJoystickX:](v3, "setRightJoystickX:", v20);
  -[AXEventGameControllerInfoRepresentation setRightJoystickY:](v3, "setRightJoystickY:", v21);
  -[AXEventGameControllerInfoRepresentation setLeftJoystickButton:](v3, "setLeftJoystickButton:", v22);
  -[AXEventGameControllerInfoRepresentation setRightJoystickButton:](v3, "setRightJoystickButton:", v23);
  if (v24 != 0.0)
  {
    IntegerValue = IOHIDEventGetIntegerValue();
    switch(IntegerValue)
    {
      case 547:
        -[AXEventGameControllerInfoRepresentation setHomeButton:](v3, "setHomeButton:", (double)IOHIDEventGetIntegerValue());
        break;
      case 521:
        -[AXEventGameControllerInfoRepresentation setViewButton:](v3, "setViewButton:", (double)IOHIDEventGetIntegerValue());
        break;
      case 516:
        -[AXEventGameControllerInfoRepresentation setMenuButton:](v3, "setMenuButton:", (double)IOHIDEventGetIntegerValue());
        break;
    }
  }
  return v3;
}

@end
