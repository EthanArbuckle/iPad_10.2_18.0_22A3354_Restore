@implementation AXElementVision__generated__Output

- (AXElementVision__generated__Output)initWithConfidence:(id)a3 coordinates:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  if (self)
  {
    objc_storeStrong((id *)&self->_confidence, a3);
    objc_storeStrong((id *)&self->_coordinates, a4);
  }

  return self;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6289488);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("confidence")) & 1) != 0)
  {
    v5 = 8;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("coordinates")))
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = 16;
  }
  objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", *(Class *)((char *)&self->super.isa + v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v6;
}

- (MLMultiArray)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(id)a3
{
  objc_storeStrong((id *)&self->_confidence, a3);
}

- (MLMultiArray)coordinates
{
  return self->_coordinates;
}

- (void)setCoordinates:(id)a3
{
  objc_storeStrong((id *)&self->_coordinates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinates, 0);
  objc_storeStrong((id *)&self->_confidence, 0);
}

@end
