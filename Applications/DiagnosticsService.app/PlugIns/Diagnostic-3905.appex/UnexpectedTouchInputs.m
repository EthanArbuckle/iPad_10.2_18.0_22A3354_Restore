@implementation UnexpectedTouchInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, void *, _BYTE *);
  void *v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  _BYTE v27[8];

  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27[0] = 0;
  -[UnexpectedTouchInputs setConnectedToPowerRequired:](self, "setConnectedToPowerRequired:", objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("connectedToPowerRequired"), 0, v27));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromRequiredKey:maxLength:failed:", CFSTR("fadeColor"), 7, v25 + 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithHexValue:error:](UIColor, "colorWithHexValue:error:", v5, 0));
  -[UnexpectedTouchInputs setFadeColor:](self, "setFadeColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchInputs fadeColor](self, "fadeColor"));
  v8 = v25;
  if (!v7)
    *((_BYTE *)v25 + 24) = 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromRequiredKey:maxLength:failed:", CFSTR("touchColor"), 7, v8 + 3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithHexValue:error:](UIColor, "colorWithHexValue:error:", v9, 0));
  -[UnexpectedTouchInputs setTouchColor:](self, "setTouchColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UnexpectedTouchInputs touchColor](self, "touchColor"));
  v12 = v25;
  if (!v11)
    *((_BYTE *)v25 + 24) = 1;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("minutesToRun"), &off_100008778, &off_100008790, v12 + 3));
  -[UnexpectedTouchInputs setMinutesToRun:](self, "setMinutesToRun:", objc_msgSend(v13, "intValue"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_dictionaryFromRequiredKey:failed:", CFSTR("touchMap"), v25 + 3));
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_100002244;
  v21 = &unk_100008270;
  v23 = &v24;
  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v14, "count")));
  v22 = v15;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", &v18);
  -[UnexpectedTouchInputs setTouchMap:](self, "setTouchMap:", v15, v18, v19, v20, v21);
  v16 = *((_BYTE *)v25 + 24) == 0;

  _Block_object_dispose(&v24, 8);
  return v16;
}

- (NSArray)touchMap
{
  return self->_touchMap;
}

- (void)setTouchMap:(id)a3
{
  objc_storeStrong((id *)&self->_touchMap, a3);
}

- (UIColor)fadeColor
{
  return self->_fadeColor;
}

- (void)setFadeColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIColor)touchColor
{
  return self->_touchColor;
}

- (void)setTouchColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)minutesToRun
{
  return self->_minutesToRun;
}

- (void)setMinutesToRun:(int)a3
{
  self->_minutesToRun = a3;
}

- (BOOL)connectedToPowerRequired
{
  return self->_connectedToPowerRequired;
}

- (void)setConnectedToPowerRequired:(BOOL)a3
{
  self->_connectedToPowerRequired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchColor, 0);
  objc_storeStrong((id *)&self->_fadeColor, 0);
  objc_storeStrong((id *)&self->_touchMap, 0);
}

@end
