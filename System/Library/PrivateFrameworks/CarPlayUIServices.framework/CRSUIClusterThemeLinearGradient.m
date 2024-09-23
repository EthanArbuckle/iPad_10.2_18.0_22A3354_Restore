@implementation CRSUIClusterThemeLinearGradient

- (CRSUIClusterThemeLinearGradient)initWithLocations:(id)a3 colors:(id)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  id v12;
  id v13;
  CRSUIClusterThemeLinearGradient *v14;
  uint64_t v15;
  NSArray *locations;
  objc_super v18;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v12 = a3;
  v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CRSUIClusterThemeLinearGradient;
  v14 = -[CRSUIClusterThemeLinearGradient init](&v18, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    locations = v14->_locations;
    v14->_locations = (NSArray *)v15;

    objc_storeStrong((id *)&v14->_themeColors, a4);
    v14->_startPoint.x = v9;
    v14->_startPoint.y = v8;
    v14->_endPoint.x = x;
    v14->_endPoint.y = y;
  }

  return v14;
}

- (NSArray)colors
{
  return (NSArray *)-[NSArray bs_map:](self->_themeColors, "bs_map:", &__block_literal_global_8);
}

uint64_t __41__CRSUIClusterThemeLinearGradient_colors__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "color");
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (CRSUIClusterThemeLinearGradient)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CRSUIClusterThemeLinearGradient *v17;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v5, objc_opt_class(), CFSTR("locations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v7, objc_opt_class(), CFSTR("colors"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("startPoint"));
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("endPoint"));
  v14 = v13;
  v16 = v15;

  v17 = -[CRSUIClusterThemeLinearGradient initWithLocations:colors:startPoint:endPoint:](self, "initWithLocations:colors:startPoint:endPoint:", v6, v8, v10, v12, v14, v16);
  return v17;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  NSArray *locations;
  id v5;

  locations = self->_locations;
  v5 = a3;
  objc_msgSend(v5, "encodeCollection:forKey:", locations, CFSTR("locations"));
  objc_msgSend(v5, "encodeCollection:forKey:", self->_themeColors, CFSTR("colors"));
  objc_msgSend(v5, "encodeCGPoint:forKey:", CFSTR("startPoint"), self->_startPoint.x, self->_startPoint.y);
  objc_msgSend(v5, "encodeCGPoint:forKey:", CFSTR("endPoint"), self->_endPoint.x, self->_endPoint.y);

}

- (NSArray)locations
{
  return self->_locations;
}

- (CGPoint)startPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_startPoint.x;
  y = self->_startPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)endPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_endPoint.x;
  y = self->_endPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_themeColors, 0);
}

@end
