@implementation _GCDeviceExtendedGamepadComponentDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)createWithContext:(id)a3
{
  GCExtendedGamepad *v4;
  void *v5;
  GCExtendedGamepad *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  void *v47;
  char v48;
  void *v49;
  char v50;
  void *v51;
  char v52;
  void *v53;
  char v54;
  void *v55;
  char v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t i;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[1592];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v62 = a3;
  bzero(v67, 0x638uLL);
  v4 = [GCExtendedGamepad alloc];
  -[_GCDevicePhysicalInputComponentDescription identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GCExtendedGamepad initWithIdentifier:info:](v4, "initWithIdentifier:info:", v5, v67);

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[_GCDevicePhysicalInputComponentDescription elementDescriptions](self, "elementDescriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v64;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v64 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v10);
        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Button A"));

        if (v13)
        {
          -[GCPhysicalInputProfile _buttonWithDescription:](v6, "_buttonWithDescription:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[GCExtendedGamepad setValue:forKey:](v6, "setValue:forKey:", v14, CFSTR("_button0"));
LABEL_38:

          goto LABEL_39;
        }
        objc_msgSend(v11, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("Button B"));

        if (v16)
        {
          -[GCPhysicalInputProfile _buttonWithDescription:](v6, "_buttonWithDescription:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[GCExtendedGamepad setValue:forKey:](v6, "setValue:forKey:", v14, CFSTR("_button1"));
          goto LABEL_38;
        }
        objc_msgSend(v11, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("Button X"));

        if (v18)
        {
          -[GCPhysicalInputProfile _buttonWithDescription:](v6, "_buttonWithDescription:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[GCExtendedGamepad setValue:forKey:](v6, "setValue:forKey:", v14, CFSTR("_button2"));
          goto LABEL_38;
        }
        objc_msgSend(v11, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("Button Y"));

        if (v20)
        {
          -[GCPhysicalInputProfile _buttonWithDescription:](v6, "_buttonWithDescription:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[GCExtendedGamepad setValue:forKey:](v6, "setValue:forKey:", v14, CFSTR("_button3"));
          goto LABEL_38;
        }
        objc_msgSend(v11, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("Left Shoulder"));

        if (v22)
        {
          -[GCPhysicalInputProfile _buttonWithDescription:](v6, "_buttonWithDescription:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[GCExtendedGamepad setValue:forKey:](v6, "setValue:forKey:", v14, CFSTR("_leftShoulder"));
          goto LABEL_38;
        }
        objc_msgSend(v11, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("Right Shoulder"));

        if (v24)
        {
          -[GCPhysicalInputProfile _buttonWithDescription:](v6, "_buttonWithDescription:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[GCExtendedGamepad setValue:forKey:](v6, "setValue:forKey:", v14, CFSTR("_rightShoulder"));
          goto LABEL_38;
        }
        objc_msgSend(v11, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("Left Trigger"));

        if (v26)
        {
          -[GCPhysicalInputProfile _buttonWithDescription:](v6, "_buttonWithDescription:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[GCExtendedGamepad setValue:forKey:](v6, "setValue:forKey:", v14, CFSTR("_leftTrigger"));
          goto LABEL_38;
        }
        objc_msgSend(v11, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("Right Trigger"));

        if (v28)
        {
          -[GCPhysicalInputProfile _buttonWithDescription:](v6, "_buttonWithDescription:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[GCExtendedGamepad setValue:forKey:](v6, "setValue:forKey:", v14, CFSTR("_rightTrigger"));
          goto LABEL_38;
        }
        objc_msgSend(v11, "name");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("Left Thumbstick Button"));

        if (v30)
        {
          -[GCPhysicalInputProfile _buttonWithDescription:](v6, "_buttonWithDescription:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[GCExtendedGamepad setValue:forKey:](v6, "setValue:forKey:", v14, CFSTR("_leftThumbstickButton"));
          goto LABEL_38;
        }
        objc_msgSend(v11, "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("Right Thumbstick Button"));

        if (v32)
        {
          -[GCPhysicalInputProfile _buttonWithDescription:](v6, "_buttonWithDescription:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[GCExtendedGamepad setValue:forKey:](v6, "setValue:forKey:", v14, CFSTR("_rightThumbstickButton"));
          goto LABEL_38;
        }
        objc_msgSend(v11, "name");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("Direction Pad"));

        if (v34)
        {
          -[GCPhysicalInputProfile _directionPadWithDescription:](v6, "_directionPadWithDescription:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[GCExtendedGamepad setValue:forKey:](v6, "setValue:forKey:", v14, CFSTR("_dpad"));
          goto LABEL_38;
        }
        objc_msgSend(v11, "name");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("Left Thumbstick"));

        if (v36)
        {
          -[GCPhysicalInputProfile _directionPadWithDescription:](v6, "_directionPadWithDescription:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[GCExtendedGamepad setValue:forKey:](v6, "setValue:forKey:", v14, CFSTR("_leftThumbstick"));
          goto LABEL_38;
        }
        objc_msgSend(v11, "name");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("Right Thumbstick"));

        if (v38)
        {
          -[GCPhysicalInputProfile _directionPadWithDescription:](v6, "_directionPadWithDescription:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[GCExtendedGamepad setValue:forKey:](v6, "setValue:forKey:", v14, CFSTR("_rightThumbstick"));
          goto LABEL_38;
        }
        objc_msgSend(v11, "name");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("Button Menu"));

        if (v40)
        {
          -[GCPhysicalInputProfile _buttonWithDescription:](v6, "_buttonWithDescription:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[GCExtendedGamepad setValue:forKey:](v6, "setValue:forKey:", v14, CFSTR("_buttonMenu"));
          goto LABEL_38;
        }
        objc_msgSend(v11, "name");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("Button Options"));

        if (v42)
        {
          -[GCPhysicalInputProfile _buttonWithDescription:](v6, "_buttonWithDescription:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[GCExtendedGamepad setValue:forKey:](v6, "setValue:forKey:", v14, CFSTR("_buttonOptions"));
          goto LABEL_38;
        }
        objc_msgSend(v11, "name");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("Button Home"));

        if (v44)
        {
          -[GCPhysicalInputProfile _buttonWithDescription:](v6, "_buttonWithDescription:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[GCExtendedGamepad setValue:forKey:](v6, "setValue:forKey:", v14, CFSTR("_buttonHome"));
          goto LABEL_38;
        }
        objc_msgSend(v11, "name");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("Left Bumper"));

        if ((v46 & 1) != 0)
          goto LABEL_48;
        objc_msgSend(v11, "name");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("Right Bumper"));

        if ((v48 & 1) != 0)
          goto LABEL_48;
        objc_msgSend(v11, "name");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("Back Left Button 0"));

        if ((v50 & 1) != 0)
          goto LABEL_48;
        objc_msgSend(v11, "name");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("Back Right Button 0"));

        if ((v52 & 1) != 0)
          goto LABEL_48;
        objc_msgSend(v11, "name");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("Back Left Button 1"));

        if ((v54 & 1) != 0
          || (objc_msgSend(v11, "name"),
              v55 = (void *)objc_claimAutoreleasedReturnValue(),
              v56 = objc_msgSend(v55, "isEqualToString:", CFSTR("Back Right Button 1")),
              v55,
              (v56 & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
LABEL_48:
          v57 = -[GCPhysicalInputProfile _buttonWithDescription:](v6, "_buttonWithDescription:", v11);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v58 = -[GCPhysicalInputProfile _directionPadWithDescription:](v6, "_directionPadWithDescription:", v11);
        }
LABEL_39:
        ++v10;
      }
      while (v8 != v10);
      v59 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
      v8 = v59;
    }
    while (v59);
  }

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)&v67[i]);

  return v6;
}

@end
