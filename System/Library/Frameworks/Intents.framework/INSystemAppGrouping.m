@implementation INSystemAppGrouping

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSArray)iOS
{
  return self->_iOS;
}

- (void)setIOS:(id)a3
{
  objc_storeStrong((id *)&self->_iOS, a3);
}

- (NSString)macOS
{
  return self->_macOS;
}

- (void)setMacOS:(id)a3
{
  objc_storeStrong((id *)&self->_macOS, a3);
}

- (NSArray)watchOS
{
  return self->_watchOS;
}

- (void)setWatchOS:(id)a3
{
  objc_storeStrong((id *)&self->_watchOS, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchOS, 0);
  objc_storeStrong((id *)&self->_macOS, 0);
  objc_storeStrong((id *)&self->_iOS, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (id)groupingForKey:(id)a3 iOS:(id)a4 macOS:(id)a5 watchOS:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  INSystemAppGrouping *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(INSystemAppGrouping);
  -[INSystemAppGrouping setKey:](v13, "setKey:", v9);
  -[INSystemAppGrouping setIOS:](v13, "setIOS:", v10);
  -[INSystemAppGrouping setMacOS:](v13, "setMacOS:", v11);
  -[INSystemAppGrouping setWatchOS:](v13, "setWatchOS:", v12);

  return v13;
}

@end
