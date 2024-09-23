@implementation ATXRouteCacheKey

- (BOOL)isEqual:(id)a3
{
  ATXRouteCacheKey *v4;
  ATXRouteCacheKey *v5;
  id *v6;
  NSString *destinationLocation;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  BOOL v12;
  NSString *transportType;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  char v17;

  v4 = (ATXRouteCacheKey *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        destinationLocation = self->destinationLocation;
        v8 = (NSString *)v6[1];
        if (destinationLocation == v8)
        {

        }
        else
        {
          v9 = v8;
          v10 = destinationLocation;
          v11 = -[NSString isEqual:](v10, "isEqual:", v9);

          if ((v11 & 1) == 0)
            goto LABEL_12;
        }
        transportType = self->transportType;
        v14 = (NSString *)v6[2];
        if (transportType == v14)
        {

        }
        else
        {
          v15 = v14;
          v16 = transportType;
          v17 = -[NSString isEqual:](v16, "isEqual:", v15);

          if ((v17 & 1) == 0)
          {
LABEL_12:
            v12 = 0;
LABEL_15:

            goto LABEL_16;
          }
        }
        v12 = self->localOnlyAfterFirstUpdate == *((unsigned __int8 *)v6 + 24);
        goto LABEL_15;
      }
    }
    v12 = 0;
  }
LABEL_16:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->destinationLocation, "hash");
  v4 = -[NSString hash](self->transportType, "hash");
  return self->localOnlyAfterFirstUpdate - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@ to %@ (local:%i)]"), self->transportType, self->destinationLocation, self->localOnlyAfterFirstUpdate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->transportType, 0);
  objc_storeStrong((id *)&self->destinationLocation, 0);
}

@end
