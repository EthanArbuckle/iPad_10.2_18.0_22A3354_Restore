@implementation CMITiledInferenceProcessorNetworkConfig

- (void)setNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_network, a3);
}

- (NSArray)networkOutputNames
{
  return self->_networkOutputNames;
}

- (NSArray)networkInputNames
{
  return self->_networkInputNames;
}

- (BOOL)isEspressoV2Path
{
  void *v2;
  char v3;

  -[NSString pathExtension](self->_networkPath, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("bundle"));

  return v3;
}

- (NSString)networkPath
{
  return self->_networkPath;
}

- (void)setNetworkPath:(id)a3
{
  objc_storeStrong((id *)&self->_networkPath, a3);
}

- (void)setNetworkInputNames:(id)a3
{
  objc_storeStrong((id *)&self->_networkInputNames, a3);
}

- (void)setNetworkOutputNames:(id)a3
{
  objc_storeStrong((id *)&self->_networkOutputNames, a3);
}

- (CMIInferenceNetwork)network
{
  return self->_network;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_networkOutputNames, 0);
  objc_storeStrong((id *)&self->_networkInputNames, 0);
  objc_storeStrong((id *)&self->_networkPath, 0);
}

@end
