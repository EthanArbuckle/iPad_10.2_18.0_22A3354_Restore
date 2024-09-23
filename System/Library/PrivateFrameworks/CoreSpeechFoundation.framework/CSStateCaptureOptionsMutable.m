@implementation CSStateCaptureOptionsMutable

- (void)setStateDataTitle:(id)a3
{
  objc_storeStrong((id *)&self->_stateDataTitle, a3);
}

- (void)setStateData:(id)a3
{
  objc_storeStrong((id *)&self->_stateData, a3);
}

- (NSString)stateDataTitle
{
  return self->_stateDataTitle;
}

- (NSDictionary)stateData
{
  return self->_stateData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateData, 0);
  objc_storeStrong((id *)&self->_stateDataTitle, 0);
}

@end
