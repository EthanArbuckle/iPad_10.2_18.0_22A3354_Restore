@implementation _GCGamepadEventImpl

- (float)dpadUpValue
{
  return self->_data.buttons[0];
}

- (void)setDpadUpValue:(float)a3
{
  self->_data.mask |= 1uLL;
  self->_data.buttons[0] = a3;
}

- (float)dpadDownValue
{
  return self->_data.buttons[1];
}

- (void)setDpadDownValue:(float)a3
{
  self->_data.mask |= 2uLL;
  self->_data.buttons[1] = a3;
}

- (float)dpadLeftValue
{
  return self->_data.buttons[2];
}

- (void)setDpadLeftValue:(float)a3
{
  self->_data.mask |= 4uLL;
  self->_data.buttons[2] = a3;
}

- (float)dpadRightValue
{
  return self->_data.buttons[3];
}

- (void)setDpadRightValue:(float)a3
{
  self->_data.mask |= 8uLL;
  self->_data.buttons[3] = a3;
}

- (float)buttonAValue
{
  return self->_data.buttons[4];
}

- (void)setButtonAValue:(float)a3
{
  self->_data.mask |= 0x10uLL;
  self->_data.buttons[4] = a3;
}

- (float)buttonBValue
{
  return self->_data.buttons[5];
}

- (void)setButtonBValue:(float)a3
{
  self->_data.mask |= 0x20uLL;
  self->_data.buttons[5] = a3;
}

- (float)buttonXValue
{
  return self->_data.buttons[6];
}

- (void)setButtonXValue:(float)a3
{
  self->_data.mask |= 0x40uLL;
  self->_data.buttons[6] = a3;
}

- (float)buttonYValue
{
  return self->_data.buttons[7];
}

- (void)setButtonYValue:(float)a3
{
  self->_data.mask |= 0x80uLL;
  self->_data.buttons[7] = a3;
}

- (float)buttonLeftShoulder
{
  return self->_data.buttons[8];
}

- (void)setButtonLeftShoulder:(float)a3
{
  self->_data.mask |= 0x100uLL;
  self->_data.buttons[8] = a3;
}

- (float)buttonRightShoulder
{
  return self->_data.buttons[9];
}

- (void)setButtonRightShoulder:(float)a3
{
  self->_data.mask |= 0x200uLL;
  self->_data.buttons[9] = a3;
}

- (float)leftThumbstickUp
{
  return self->_data.buttons[10];
}

- (void)setLeftThumbstickUp:(float)a3
{
  self->_data.mask |= 0x400uLL;
  self->_data.buttons[10] = a3;
}

- (float)leftThumbstickDown
{
  return self->_data.buttons[11];
}

- (void)setLeftThumbstickDown:(float)a3
{
  self->_data.mask |= 0x800uLL;
  self->_data.buttons[11] = a3;
}

- (float)leftThumbstickLeft
{
  return self->_data.buttons[12];
}

- (void)setLeftThumbstickLeft:(float)a3
{
  self->_data.mask |= 0x1000uLL;
  self->_data.buttons[12] = a3;
}

- (float)leftThumbstickRight
{
  return self->_data.buttons[13];
}

- (void)setLeftThumbstickRight:(float)a3
{
  self->_data.mask |= 0x2000uLL;
  self->_data.buttons[13] = a3;
}

- (float)rightThumbstickUp
{
  return self->_data.buttons[14];
}

- (void)setRightThumbstickUp:(float)a3
{
  self->_data.mask |= 0x4000uLL;
  self->_data.buttons[14] = a3;
}

- (float)rightThumbstickDown
{
  return self->_data.buttons[15];
}

- (void)setRightThumbstickDown:(float)a3
{
  self->_data.mask |= 0x8000uLL;
  self->_data.buttons[15] = a3;
}

- (float)rightThumbstickLeft
{
  return self->_data.buttons[16];
}

- (void)setRightThumbstickLeft:(float)a3
{
  self->_data.mask |= 0x10000uLL;
  self->_data.buttons[16] = a3;
}

- (float)rightThumbstickRight
{
  return self->_data.buttons[17];
}

- (void)setRightThumbstickRight:(float)a3
{
  self->_data.mask |= 0x20000uLL;
  self->_data.buttons[17] = a3;
}

- (float)leftTrigger
{
  return self->_data.buttons[18];
}

- (void)setLeftTrigger:(float)a3
{
  self->_data.mask |= 0x40000uLL;
  self->_data.buttons[18] = a3;
}

- (float)rightTrigger
{
  return self->_data.buttons[19];
}

- (void)setRightTrigger:(float)a3
{
  self->_data.mask |= 0x80000uLL;
  self->_data.buttons[19] = a3;
}

- (float)leftThumbstickButton
{
  return self->_data.buttons[20];
}

- (void)setLeftThumbstickButton:(float)a3
{
  self->_data.mask |= 0x100000uLL;
  self->_data.buttons[20] = a3;
}

- (float)rightThumbstickButton
{
  return self->_data.buttons[21];
}

- (void)setRightThumbstickButton:(float)a3
{
  self->_data.mask |= 0x200000uLL;
  self->_data.buttons[21] = a3;
}

- (float)buttonHome
{
  return self->_data.buttons[22];
}

- (void)setButtonHome:(float)a3
{
  self->_data.mask |= 0x400000uLL;
  self->_data.buttons[22] = a3;
}

- (float)buttonMenu
{
  return self->_data.buttons[23];
}

- (void)setButtonMenu:(float)a3
{
  self->_data.mask |= 0x800000uLL;
  self->_data.buttons[23] = a3;
}

- (float)buttonOptions
{
  return self->_data.buttons[24];
}

- (void)setButtonOptions:(float)a3
{
  self->_data.mask |= 0x1000000uLL;
  self->_data.buttons[24] = a3;
}

- (float)buttonSpecial0
{
  return self->_data.buttons[25];
}

- (void)setButtonSpecial0:(float)a3
{
  self->_data.mask |= 0x2000000uLL;
  self->_data.buttons[25] = a3;
}

- (float)buttonSpecial1
{
  return self->_data.buttons[26];
}

- (void)setButtonSpecial1:(float)a3
{
  self->_data.mask |= 0x4000000uLL;
  self->_data.buttons[26] = a3;
}

- (float)buttonSpecial2
{
  return self->_data.buttons[27];
}

- (void)setButtonSpecial2:(float)a3
{
  self->_data.mask |= 0x8000000uLL;
  self->_data.buttons[27] = a3;
}

- (float)buttonSpecial3
{
  return self->_data.buttons[28];
}

- (void)setButtonSpecial3:(float)a3
{
  self->_data.mask |= 0x10000000uLL;
  self->_data.buttons[28] = a3;
}

- (float)buttonSpecial4
{
  return self->_data.buttons[29];
}

- (void)setButtonSpecial4:(float)a3
{
  self->_data.mask |= 0x20000000uLL;
  self->_data.buttons[29] = a3;
}

- (float)buttonSpecial5
{
  return self->_data.buttons[30];
}

- (void)setButtonSpecial5:(float)a3
{
  self->_data.mask |= 0x40000000uLL;
  self->_data.buttons[30] = a3;
}

- (float)buttonSpecial6
{
  return self->_data.buttons[31];
}

- (void)setButtonSpecial6:(float)a3
{
  self->_data.mask |= 0x80000000uLL;
  self->_data.buttons[31] = a3;
}

- (float)buttonSpecial7
{
  return self->_data.buttons[32];
}

- (void)setButtonSpecial7:(float)a3
{
  self->_data.mask |= 0x100000000uLL;
  self->_data.buttons[32] = a3;
}

- (float)buttonSpecial8
{
  return self->_data.buttons[33];
}

- (void)setButtonSpecial8:(float)a3
{
  self->_data.mask |= 0x200000000uLL;
  self->_data.buttons[33] = a3;
}

- (float)buttonSpecial9
{
  return self->_data.buttons[34];
}

- (void)setButtonSpecial9:(float)a3
{
  self->_data.mask |= 0x400000000uLL;
  self->_data.buttons[34] = a3;
}

- (float)buttonSpecial10
{
  return self->_data.buttons[35];
}

- (void)setButtonSpecial10:(float)a3
{
  self->_data.mask |= 0x800000000uLL;
  self->_data.buttons[35] = a3;
}

- (float)buttonSpecial11
{
  return self->_data.buttons[36];
}

- (void)setButtonSpecial11:(float)a3
{
  self->_data.mask |= 0x1000000000uLL;
  self->_data.buttons[36] = a3;
}

- (float)buttonSpecial12
{
  return self->_data.buttons[37];
}

- (void)setButtonSpecial12:(float)a3
{
  self->_data.mask |= 0x2000000000uLL;
  self->_data.buttons[37] = a3;
}

- (float)buttonSpecial13
{
  return self->_data.buttons[38];
}

- (void)setButtonSpecial13:(float)a3
{
  self->_data.mask |= 0x4000000000uLL;
  self->_data.buttons[38] = a3;
}

- (float)buttonSpecial14
{
  return self->_data.buttons[39];
}

- (void)setButtonSpecial14:(float)a3
{
  self->_data.mask |= 0x8000000000uLL;
  self->_data.buttons[39] = a3;
}

- (float)buttonSpecial15
{
  return self->_data.buttons[40];
}

- (void)setButtonSpecial15:(float)a3
{
  self->_data.mask |= 0x10000000000uLL;
  self->_data.buttons[40] = a3;
}

- (float)buttonLeftBumper
{
  return self->_data.buttons[41];
}

- (void)setButtonLeftBumper:(float)a3
{
  self->_data.mask |= 0x20000000000uLL;
  self->_data.buttons[41] = a3;
}

- (float)buttonRightBumper
{
  return self->_data.buttons[42];
}

- (void)setButtonRightBumper:(float)a3
{
  self->_data.mask |= 0x40000000000uLL;
  self->_data.buttons[42] = a3;
}

- (float)buttonBackLeftPrimary
{
  return self->_data.buttons[43];
}

- (void)setButtonBackLeftPrimary:(float)a3
{
  self->_data.mask |= 0x80000000000uLL;
  self->_data.buttons[43] = a3;
}

- (float)buttonBackLeftSecondary
{
  return self->_data.buttons[44];
}

- (void)setButtonBackLeftSecondary:(float)a3
{
  self->_data.mask |= 0x100000000000uLL;
  self->_data.buttons[44] = a3;
}

- (float)buttonBackRightPrimary
{
  return self->_data.buttons[45];
}

- (void)setButtonBackRightPrimary:(float)a3
{
  self->_data.mask |= 0x200000000000uLL;
  self->_data.buttons[45] = a3;
}

- (float)buttonBackRightSecondary
{
  return self->_data.buttons[46];
}

- (void)setButtonBackRightSecondary:(float)a3
{
  self->_data.mask |= 0x400000000000uLL;
  self->_data.buttons[46] = a3;
}

- (_GCGamepadEventImpl)initWithTimeStamp:(unint64_t)a3 inputs:(float)a4[47] validMask:(unint64_t)a5
{
  _GCGamepadEventImpl *result;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_GCGamepadEventImpl;
  result = -[_GCGamepadEventImpl init](&v10, sel_init);
  if (result)
  {
    v9 = 0;
    result->_timestamp = a3;
    result->_data.mask = a5;
    do
    {
      result->_data.buttons[v9] = a4[v9];
      ++v9;
    }
    while (v9 != 47);
  }
  return result;
}

- (_GCGamepadEventImpl)initWithGamepadEvent:(id)a3
{
  id v4;
  _GCGamepadEventImpl *v5;
  uint64_t v6;
  float v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GCGamepadEventImpl;
  v5 = -[_GCGamepadEventImpl init](&v9, sel_init);
  if (v5)
  {
    v6 = 0;
    v5->_timestamp = objc_msgSend(v4, "timestamp");
    do
    {
      v5->_data.mask |= (unint64_t)objc_msgSend(v4, "hasValidValueForElement:", v6) << v6;
      objc_msgSend(v4, "floatValueForElement:", v6);
      v5->_data.buttons[v6++] = v7;
    }
    while (v6 != 47);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  objc_opt_class();
  result = (id)objc_opt_new();
  *((_QWORD *)result + 1) = self->_timestamp;
  v5 = *(_OWORD *)&self->_data.buttons[34];
  v6 = *(_OWORD *)&self->_data.buttons[38];
  v7 = *(_OWORD *)&self->_data.buttons[42];
  *((_QWORD *)result + 26) = *(_QWORD *)&self->_data.buttons[46];
  *((_OWORD *)result + 11) = v6;
  *((_OWORD *)result + 12) = v7;
  *((_OWORD *)result + 10) = v5;
  v8 = *(_OWORD *)&self->_data.buttons[18];
  v9 = *(_OWORD *)&self->_data.buttons[22];
  v10 = *(_OWORD *)&self->_data.buttons[30];
  *((_OWORD *)result + 8) = *(_OWORD *)&self->_data.buttons[26];
  *((_OWORD *)result + 9) = v10;
  *((_OWORD *)result + 6) = v8;
  *((_OWORD *)result + 7) = v9;
  v11 = *(_OWORD *)&self->_data.buttons[2];
  v12 = *(_OWORD *)&self->_data.buttons[6];
  v13 = *(_OWORD *)&self->_data.buttons[14];
  *((_OWORD *)result + 4) = *(_OWORD *)&self->_data.buttons[10];
  *((_OWORD *)result + 5) = v13;
  *((_OWORD *)result + 2) = v11;
  *((_OWORD *)result + 3) = v12;
  *((_OWORD *)result + 1) = *(_OWORD *)&self->_data.mask;
  return result;
}

- (NSString)debugDescription
{
  uint64_t v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  double v37;
  float v38;
  double v39;
  float v40;
  double v41;
  float v42;
  double v43;
  float v44;
  double v45;
  float v46;
  double v47;
  float v48;
  double v49;
  float v50;
  double v51;
  float v52;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;

  v3 = objc_opt_class();
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 0);
  v85 = v4;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 1);
  v84 = v5;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 2);
  v83 = v6;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 3);
  v82 = v7;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 4);
  v81 = v8;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 5);
  v80 = v9;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 6);
  v79 = v10;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 7);
  v78 = v11;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 8);
  v77 = v12;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 9);
  v76 = v13;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 10);
  v75 = v14;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 11);
  v74 = v15;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 12);
  v73 = v16;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 13);
  v72 = v17;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 14);
  v71 = v18;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 15);
  v70 = v19;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 16);
  v69 = v20;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 17);
  v68 = v21;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 18);
  v67 = v22;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 19);
  v66 = v23;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 20);
  v65 = v24;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 21);
  v64 = v25;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 22);
  v63 = v26;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 23);
  v62 = v27;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 24);
  v61 = v28;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 25);
  v60 = v29;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 26);
  v59 = v30;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 27);
  v58 = v31;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 28);
  v57 = v32;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 29);
  v56 = v33;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 30);
  v55 = v34;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 31);
  v54 = v35;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 32);
  v37 = v36;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 33);
  v39 = v38;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 34);
  v41 = v40;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 35);
  v43 = v42;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 36);
  v45 = v44;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 37);
  v47 = v46;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 38);
  v49 = v48;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 39);
  v51 = v50;
  -[_GCGamepadEventImpl floatValueForElement:](self, "floatValueForElement:", 40);
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ %p> {\n\t.DpadUp: %f\n\t.DpadDown: %f\n\t.DpadLeft: %f\n\t.DpadRight: %f\n\t.ButtonA: %f\n\t.ButtonB: %f\n\t.ButtonX: %f\n\t.ButtonY: %f\n\t.LeftShoulder: %f\n\t.RightShoulder: %f\n\t.LeftThumbstickUp: %f\n\t.LeftThumbstickDown: %f\n\t.LeftThumbstickLeft: %f\n\t.LeftThumbstickRight: %f\n\t.RightThumbstickUp: %f\n\t.RightThumbstickDown: %f\n\t.RightThumbstickLeft: %f\n\t.RightThumbstickRight: %f\n\t.LeftTrigger: %f\n\t.RightTrigger: %f\n\t.LeftThumbstickButton: %f\n\t.RightThumbstickButton: %f\n\t.ButtonHome: %f\n\t.ButtonMenu: %f\n\t.ButtonOptions: %f\n\t.ButtonSpecial0: %f\n\t.ButtonSpecial1: %f\n\t.ButtonSpecial2: %f\n\t.ButtonSpecial3: %f\n\t.ButtonSpecial4: %f\n\t.ButtonSpecial5: %f\n\t.ButtonSpecial6: %f\n\t.ButtonSpecial7: %f\n\t.ButtonSpecial8: %f\n\t.ButtonSpecial9: %f\n\t.ButtonSpecial10: %f\n\t.ButtonSpecial11: %f\n\t.ButtonSpecial12: %f\n\t.ButtonSpecial13: %f\n\t.ButtonSpecial14: %f\n\t.ButtonShare: %f\n}"), v3, self, *(_QWORD *)&v85, *(_QWORD *)&v84, *(_QWORD *)&v83, *(_QWORD *)&v82, *(_QWORD *)&v81, *(_QWORD *)&v80, *(_QWORD *)&v79, *(_QWORD *)&v78, *(_QWORD *)&v77, *(_QWORD *)&v76, *(_QWORD *)&v75, *(_QWORD *)&v74, *(_QWORD *)&v73, *(_QWORD *)&v72,
           *(_QWORD *)&v71,
           *(_QWORD *)&v70,
           *(_QWORD *)&v69,
           *(_QWORD *)&v68,
           *(_QWORD *)&v67,
           *(_QWORD *)&v66,
           *(_QWORD *)&v65,
           *(_QWORD *)&v64,
           *(_QWORD *)&v63,
           *(_QWORD *)&v62,
           *(_QWORD *)&v61,
           *(_QWORD *)&v60,
           *(_QWORD *)&v59,
           *(_QWORD *)&v58,
           *(_QWORD *)&v57,
           *(_QWORD *)&v56,
           *(_QWORD *)&v55,
           *(_QWORD *)&v54,
           *(_QWORD *)&v37,
           *(_QWORD *)&v39,
           *(_QWORD *)&v41,
           *(_QWORD *)&v43,
           *(_QWORD *)&v45,
           *(_QWORD *)&v47,
           *(_QWORD *)&v49,
           *(_QWORD *)&v51,
           v52);
}

- (BOOL)hasValidValueForElement:(int64_t)a3
{
  _BOOL8 v4;
  void *v6;

  if (a3 > 46)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCGamepadEventImpl.m"), 214, CFSTR("Unknown element"));

    LOBYTE(v4) = 0;
  }
  else
  {
    return (self->_data.mask >> a3) & 1;
  }
  return v4;
}

- (float)floatValueForElement:(int64_t)a3
{
  void *v6;

  if (a3 <= 46)
    return self->_data.buttons[a3];
  unk_254DEC4F8(&off_254DEC660, "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCGamepadEventImpl.m"), 223, CFSTR("Unknown element"));

  return 0.0;
}

- (void)setFloatValue:(float)a3 forElement:(int64_t)a4
{
  id v6;

  if (a4 > 46)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCGamepadEventImpl.m"), 232, CFSTR("Unknown element"));

  }
  else
  {
    self->_data.buttons[a4] = a3;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

@end
