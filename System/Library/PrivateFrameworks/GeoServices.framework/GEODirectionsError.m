@implementation GEODirectionsError

+ (NSString)key
{
  return (NSString *)CFSTR("DirectionsError");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_copyProblemDetails:(GEOProblemDetail *)a3 count:(unint64_t)a4
{
  GEOProblemDetail *problemDetails;
  GEOProblemDetail *v8;

  problemDetails = self->_problemDetails;
  if (problemDetails)
  {
    free(problemDetails);
    self->_problemDetails = 0;
  }
  if (a4)
  {
    v8 = (GEOProblemDetail *)malloc_type_malloc(12 * a4, 0xF0206FF9uLL);
    self->_problemDetails = v8;
    memcpy(v8, a3, 12 * a4);
  }
  self->_problemDetailsCount = a4;
}

- (GEODirectionsError)initWithResponse:(id)a3
{
  id v4;
  GEODirectionsError *v5;
  void *v6;
  uint64_t v7;
  GEOAlert *alert;
  _GEOTransitRoutingIncidentMessage *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  GEOTransitRoutingIncidentMessage *routingIncidentMessage;
  void *v14;
  uint64_t v15;
  NSArray *internalServerErrors;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEODirectionsError;
  v5 = -[GEODirectionsError init](&v18, sel_init);
  if (v5)
  {
    -[GEODirectionsError _copyProblemDetails:count:](v5, "_copyProblemDetails:count:", objc_msgSend(v4, "problemDetails"), objc_msgSend(v4, "problemDetailsCount"));
    objc_msgSend(v4, "failureAlert");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    alert = v5->_alert;
    v5->_alert = (GEOAlert *)v7;

    v9 = [_GEOTransitRoutingIncidentMessage alloc];
    objc_msgSend(v4, "transitIncidentMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decoderData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[_GEOTransitRoutingIncidentMessage initWithIncidentMessage:decoderData:](v9, "initWithIncidentMessage:decoderData:", v10, v11);
    routingIncidentMessage = v5->_routingIncidentMessage;
    v5->_routingIncidentMessage = (GEOTransitRoutingIncidentMessage *)v12;

    objc_msgSend(v4, "internalErrors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    internalServerErrors = v5->_internalServerErrors;
    v5->_internalServerErrors = (NSArray *)v15;

  }
  return v5;
}

- (GEODirectionsError)initWithSingleProblemType:(int)a3
{
  GEODirectionsError *v4;
  GEODirectionsError *v5;
  GEODirectionsError *v6;
  int v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEODirectionsError;
  v4 = -[GEODirectionsError init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v9 = 0;
    v8 = a3;
    -[GEODirectionsError _copyProblemDetails:count:](v4, "_copyProblemDetails:count:", &v8, 1);
    v6 = v5;
  }

  return v5;
}

- (GEODirectionsError)initWithWaypointIndex:(unint64_t)a3
{
  int v3;
  GEODirectionsError *v4;
  GEODirectionsError *v5;
  _DWORD v7[3];
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEODirectionsError;
  v4 = -[GEODirectionsError init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v7[1] = v3;
    v7[2] = 3;
    v7[0] = 1;
    -[GEODirectionsError _copyProblemDetails:count:](v4, "_copyProblemDetails:count:", v7, 1);
  }
  return v5;
}

- (GEODirectionsError)initWithCoder:(id)a3
{
  id v4;
  GEODirectionsError *v5;
  uint64_t v6;
  GEOAlert *alert;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  GEOTransitRoutingIncidentMessage *routingIncidentMessage;
  uint64_t v18;
  NSArray *internalServerErrors;
  GEODirectionsError *v20;
  uint64_t v22;
  int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)GEODirectionsError;
  v5 = -[GEODirectionsError init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_alert"));
    v6 = objc_claimAutoreleasedReturnValue();
    alert = v5->_alert;
    v5->_alert = (GEOAlert *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("problemDetails"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_problemDetails = (GEOProblemDetail *)malloc_type_calloc(objc_msgSend(v8, "count"), 0xCuLL, 0x1000040CADD4576uLL);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v13));
          v23 = 0;
          v22 = 0;
          if (GEOProblemDetailReadAllFrom((uint64_t)&v22, (uint64_t)v14))
          {
            v15 = (uint64_t)&v5->_problemDetails[v5->_problemDetailsCount];
            *(_QWORD *)v15 = v22;
            *(_DWORD *)(v15 + 8) = v23;
            ++v5->_problemDetailsCount;
          }

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routingIncidentMessage"));
    v16 = objc_claimAutoreleasedReturnValue();
    routingIncidentMessage = v5->_routingIncidentMessage;
    v5->_routingIncidentMessage = (GEOTransitRoutingIncidentMessage *)v16;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_internalServerErrors"));
    v18 = objc_claimAutoreleasedReturnValue();
    internalServerErrors = v5->_internalServerErrors;
    v5->_internalServerErrors = (NSArray *)v18;

    v20 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  GEOProblemDetail *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  $7D24B5AD5894795FD85A0EE1D817D743 var2;

  v10 = a3;
  objc_msgSend(v10, "encodeObject:forKey:", self->_alert, CFSTR("_alert"));
  if (self->_problemDetailsCount)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_problemDetailsCount)
    {
      v5 = 0;
      v6 = 0;
      do
      {
        v7 = &self->_problemDetails[v5];
        v11 = *(_QWORD *)&v7->var0;
        var2 = v7->var2;
        v8 = objc_alloc_init(MEMORY[0x1E0D82B98]);
        GEOProblemDetailWriteTo((uint64_t)&v11);
        objc_msgSend(v8, "data");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v4, "addObject:", v9);

        ++v6;
        ++v5;
      }
      while (v6 < self->_problemDetailsCount);
    }
    objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("problemDetails"));

  }
  objc_msgSend(v10, "encodeObject:forKey:", self->_routingIncidentMessage, CFSTR("_routingIncidentMessage"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_internalServerErrors, CFSTR("_internalServerErrors"));

}

- (void)dealloc
{
  GEOProblemDetail *problemDetails;
  objc_super v4;

  problemDetails = self->_problemDetails;
  if (problemDetails)
    free(problemDetails);
  v4.receiver = self;
  v4.super_class = (Class)GEODirectionsError;
  -[GEODirectionsError dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  GEOProblemDetail *v7;
  $7D24B5AD5894795FD85A0EE1D817D743 var2;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  GEOComposedString *v13;
  void *v14;
  GEOComposedString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  GEOComposedString *v21;
  void *v22;
  GEOComposedString *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  $7D24B5AD5894795FD85A0EE1D817D743 v32;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_problemDetailsCount)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      v32 = 0;
      v31 = 0;
      v7 = &self->_problemDetails[v5];
      var2 = v7->var2;
      v31 = *(_QWORD *)&v7->var0;
      v32 = var2;
      GEOProblemDetailDescription((unsigned int *)&v31);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v9);

      ++v6;
      ++v5;
    }
    while (v6 < self->_problemDetailsCount);
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("GEODirectionsError of type(s): %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v13 = [GEOComposedString alloc];
  -[GEOAlert formattedTitle]((id *)&self->_alert->super.super.isa);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[GEOComposedString initWithGeoFormattedString:](v13, "initWithGeoFormattedString:", v14);

  v16 = (void *)MEMORY[0x1E0CB3940];
  -[GEOComposedString stringWithDefaultOptions](v15, "stringWithDefaultOptions");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = &stru_1E1C241D0;
  objc_msgSend(v16, "stringWithFormat:", CFSTR("Title: %@"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);

  v21 = [GEOComposedString alloc];
  -[GEOAlert formattedContent]((id *)&self->_alert->super.super.isa);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[GEOComposedString initWithGeoFormattedString:](v21, "initWithGeoFormattedString:", v22);

  v24 = (void *)MEMORY[0x1E0CB3940];
  -[GEOComposedString stringWithDefaultOptions](v23, "stringWithDefaultOptions");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
    v27 = (const __CFString *)v25;
  else
    v27 = &stru_1E1C241D0;
  objc_msgSend(v24, "stringWithFormat:", CFSTR("Content: %@"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v28);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (GEOServerFormattedString)title
{
  return (GEOServerFormattedString *)-[GEOAlert formattedTitle]((id *)&self->_alert->super.super.isa);
}

- (GEOServerFormattedString)content
{
  return (GEOServerFormattedString *)-[GEOAlert formattedContent]((id *)&self->_alert->super.super.isa);
}

- (NSString)localizedTitle
{
  return -[GEOAlert title]((id *)&self->_alert->super.super.isa);
}

- (NSString)localizedDescription
{
  return -[GEOAlert content]((id *)&self->_alert->super.super.isa);
}

- (GEOTransitRoutingIncidentMessage)incidentMessage
{
  return self->_routingIncidentMessage;
}

- (GEOProblemDetail)problemDetailAtIndex:(unint64_t)a3
{
  GEOProblemDetail *v3;
  uint64_t v4;
  $7D24B5AD5894795FD85A0EE1D817D743 var2;
  GEOProblemDetail result;

  if (self->_problemDetailsCount <= a3)
  {
    var2 = 0;
    v4 = 0;
  }
  else
  {
    v3 = &self->_problemDetails[a3];
    v4 = *(_QWORD *)&v3->var0;
    var2 = v3->var2;
  }
  result.var0 = v4;
  result.var1 = HIDWORD(v4);
  result.var2 = var2;
  return result;
}

- (int64_t)firstDirectionsErrorCode
{
  if (self->_problemDetailsCount)
    return -[GEODirectionsError _errorCodeForProblemDetail:](self, "_errorCodeForProblemDetail:", *(_QWORD *)self->_problemDetails, *(_DWORD *)&self->_problemDetails->var2);
  else
    return 0;
}

- (int64_t)_errorCodeForProblemDetail:(GEOProblemDetail)a3
{
  int64_t result;
  uint64_t v4;
  void *v5;
  int v6;
  __CFString *v7;

  if ((*(_BYTE *)&a3.var2 & 1) == 0)
    return 1;
  v4 = *(_QWORD *)&a3.var0;
  result = 13;
  switch(a3.var0)
  {
    case 1:
      if (a3.var1)
      {
        if (a3.var1 != 1)
          goto LABEL_18;
        result = 5;
      }
      else
      {
        result = 4;
      }
      break;
    case 2:
      if (a3.var1)
      {
        if (a3.var1 != 1)
          goto LABEL_18;
        result = 7;
      }
      else
      {
        result = 6;
      }
      break;
    case 3:
      result = 8;
      if ((*(_BYTE *)&a3.var2 & 2) != 0 && a3.var1)
      {
        if (a3.var1 != 1)
          goto LABEL_18;
        result = 9;
      }
      break;
    case 4:
      if (a3.var1)
      {
        if (a3.var1 != 1)
        {
LABEL_18:
          NSStringFromSelector(a2);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("%@ unexpected waypoint index"), v5);
          goto LABEL_34;
        }
        result = 11;
      }
      else
      {
        result = 10;
      }
      break;
    case 9:
      return result;
    case 0xA:
      result = 14;
      break;
    case 0xD:
      result = 16;
      break;
    case 0xE:
      result = 18;
      break;
    case 0xF:
      result = 19;
      break;
    case 0x10:
      result = 20;
      break;
    case 0x11:
      result = 21;
      break;
    case 0x13:
      result = 22;
      break;
    default:
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v4 - 5;
      if ((v4 - 5) < 0x12 && ((0x3A0C9u >> v6) & 1) != 0)
      {
        v7 = off_1E1C01F68[v6];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      NSLog(CFSTR("%@ unexpected problem detail type: %@"), v5, v7);

LABEL_34:
      return 1;
  }
  return result;
}

- (BOOL)_errorCode:(int64_t)a3 toProblem:(int *)a4
{
  int64_t v4;

  v4 = a3 - 4;
  if ((unint64_t)(a3 - 4) > 0x12 || ((0x7CFFFu >> v4) & 1) == 0)
    return 0;
  *a4 = dword_189CC29F0[v4];
  return 1;
}

- (BOOL)hasError:(int64_t)a3
{
  _BOOL4 v4;
  BOOL result;
  unint64_t problemDetailsCount;
  unint64_t v7;
  $7D24B5AD5894795FD85A0EE1D817D743 *p_var2;
  unint64_t v9;
  int v10;

  v10 = 0;
  v4 = -[GEODirectionsError _errorCode:toProblem:](self, "_errorCode:toProblem:", a3, &v10);
  result = 0;
  if (v4)
  {
    problemDetailsCount = self->_problemDetailsCount;
    if (problemDetailsCount)
    {
      v7 = problemDetailsCount - 1;
      p_var2 = &self->_problemDetails->var2;
      do
      {
        v9 = v7;
        result = *(_BYTE *)p_var2 & (*(_DWORD *)&p_var2[-2] == v10);
        if (result)
          break;
        --v7;
        p_var2 += 3;
      }
      while (v9);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (NSArray)internalServerErrors
{
  return self->_internalServerErrors;
}

- (unint64_t)problemDetailsCount
{
  return self->_problemDetailsCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalServerErrors, 0);
  objc_storeStrong((id *)&self->_routingIncidentMessage, 0);
  objc_storeStrong((id *)&self->_alert, 0);
}

@end
