@implementation TouchAccuracyInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSSet *v9;
  void *v10;
  void *v11;
  void *v12;
  char v14;

  v14 = 0;
  v4 = a3;
  -[TouchAccuracyInputs setConnectedToPowerRequired:](self, "setConnectedToPowerRequired:", objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("connectedToPowerRequired"), 0, &v14));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("partialInputTimeout"), &off_100008798, &off_1000087A8, &off_1000087B8, &v14));
  objc_msgSend(v5, "doubleValue");
  -[TouchAccuracyInputs setPartialInputTimeout:](self, "setPartialInputTimeout:");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("noInputTimeout"), &off_100008798, &off_1000087A8, &off_1000087C8, &v14));
  objc_msgSend(v6, "doubleValue");
  -[TouchAccuracyInputs setNoInputTimeout:](self, "setNoInputTimeout:");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("blockWidth"), &off_1000087D8, &off_1000087E8, &v14));
  objc_msgSend(v7, "doubleValue");
  -[TouchAccuracyInputs setBlockWidth:](self, "setBlockWidth:");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("blockHeight"), &off_1000087D8, &off_1000087E8, &v14));
  objc_msgSend(v8, "doubleValue");
  -[TouchAccuracyInputs setBlockHeight:](self, "setBlockHeight:");

  v9 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSDictionary));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromRequiredKey:types:maxLength:failed:validator:", CFSTR("positions"), v10, 25000000, &v14, &stru_100008278));

  -[TouchAccuracyInputs setPositions:](self, "setPositions:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyInputs positions](self, "positions"));
  -[TouchAccuracyInputs setNumberOfBlocks:](self, "setNumberOfBlocks:", objc_msgSend(v12, "count"));

  return v14 == 0;
}

- (double)blockWidth
{
  return self->_blockWidth;
}

- (void)setBlockWidth:(double)a3
{
  self->_blockWidth = a3;
}

- (double)blockHeight
{
  return self->_blockHeight;
}

- (void)setBlockHeight:(double)a3
{
  self->_blockHeight = a3;
}

- (NSArray)positions
{
  return self->_positions;
}

- (void)setPositions:(id)a3
{
  objc_storeStrong((id *)&self->_positions, a3);
}

- (double)noInputTimeout
{
  return self->_noInputTimeout;
}

- (void)setNoInputTimeout:(double)a3
{
  self->_noInputTimeout = a3;
}

- (double)partialInputTimeout
{
  return self->_partialInputTimeout;
}

- (void)setPartialInputTimeout:(double)a3
{
  self->_partialInputTimeout = a3;
}

- (BOOL)connectedToPowerRequired
{
  return self->_connectedToPowerRequired;
}

- (void)setConnectedToPowerRequired:(BOOL)a3
{
  self->_connectedToPowerRequired = a3;
}

- (int)numberOfBlocks
{
  return self->_numberOfBlocks;
}

- (void)setNumberOfBlocks:(int)a3
{
  self->_numberOfBlocks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positions, 0);
}

@end
