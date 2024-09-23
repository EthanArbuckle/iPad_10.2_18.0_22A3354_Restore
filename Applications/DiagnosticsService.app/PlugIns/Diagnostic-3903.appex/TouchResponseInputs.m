@implementation TouchResponseInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  void *v11;
  void *v12;
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
  -[TouchResponseInputs setConnectedToPowerRequired:](self, "setConnectedToPowerRequired:", objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("connectedToPowerRequired"), 0, v27));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("noInputTimeout"), &off_1000086F8, &off_100008708, &off_100008718, v25 + 3));
  objc_msgSend(v5, "doubleValue");
  -[TouchResponseInputs setNoInputTimeout:](self, "setNoInputTimeout:");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("timeoutSeconds"), &off_1000086F8, &off_100008708, v25 + 3));
  objc_msgSend(v6, "doubleValue");
  -[TouchResponseInputs setTimeoutSeconds:](self, "setTimeoutSeconds:");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromRequiredKey:maxLength:failed:", CFSTR("blockColor"), 7, v25 + 3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithHexValue:error:](UIColor, "colorWithHexValue:error:", v7, 0));
  -[TouchResponseInputs setBlockColor:](self, "setBlockColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseInputs blockColor](self, "blockColor"));
  v10 = v25;
  if (!v9)
    *((_BYTE *)v25 + 24) = 1;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_dictionaryFromRequiredKey:failed:", CFSTR("touchMap"), v10 + 3));
  -[TouchResponseInputs setTouchMapDictionary:](self, "setTouchMapDictionary:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseInputs touchMapDictionary](self, "touchMapDictionary"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v12, "count")));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseInputs touchMapDictionary](self, "touchMapDictionary"));
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_1000058BC;
  v21 = &unk_1000082D0;
  v23 = &v24;
  v15 = v13;
  v22 = v15;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", &v18);

  -[TouchResponseInputs setTouchMap:](self, "setTouchMap:", v15, v18, v19, v20, v21);
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

- (UIColor)blockColor
{
  return self->_blockColor;
}

- (void)setBlockColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)noInputTimeout
{
  return self->_noInputTimeout;
}

- (void)setNoInputTimeout:(double)a3
{
  self->_noInputTimeout = a3;
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (BOOL)connectedToPowerRequired
{
  return self->_connectedToPowerRequired;
}

- (void)setConnectedToPowerRequired:(BOOL)a3
{
  self->_connectedToPowerRequired = a3;
}

- (NSDictionary)touchMapDictionary
{
  return self->_touchMapDictionary;
}

- (void)setTouchMapDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_touchMapDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchMapDictionary, 0);
  objc_storeStrong((id *)&self->_blockColor, 0);
  objc_storeStrong((id *)&self->_touchMap, 0);
}

@end
