@implementation FUFlight

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[FUFlight codeShares](self, "codeShares");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "codeShares");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 != v7)
    {
      -[FUFlight codeShares](self, "codeShares");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "codeShares");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "isEqual:", v3))
      {
        v9 = 0;
        goto LABEL_32;
      }
      v71 = v8;
    }
    -[FUFlight displayAirline](self, "displayAirline");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayAirline");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 != v11)
    {
      -[FUFlight displayAirline](self, "displayAirline");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayAirline");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "isEqual:", v13))
      {
        v9 = 0;
LABEL_30:

LABEL_31:
        v8 = v71;
        if (v6 == v7)
        {
LABEL_33:

          goto LABEL_34;
        }
LABEL_32:

        goto LABEL_33;
      }
      v68 = v13;
      v69 = v12;
    }
    -[FUFlight queriedAirlineTitle](self, "queriedAirlineTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queriedAirlineTitle");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 != v72)
    {
      -[FUFlight queriedAirlineTitle](self, "queriedAirlineTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "queriedAirlineTitle");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v15, "isEqual:"))
      {
        v9 = 0;
        goto LABEL_28;
      }
      v70 = v15;
    }
    v16 = -[FUFlight displayFlightNumber](self, "displayFlightNumber");
    if (v16 == objc_msgSend(v5, "displayFlightNumber"))
    {
      -[FUFlight airline](self, "airline");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "airline");
      v64 = (void *)v17;
      v63 = objc_claimAutoreleasedReturnValue();
      v65 = v14;
      v66 = v3;
      if (v17 != v63)
      {
        -[FUFlight airline](self, "airline");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "airline");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v18;
        if (!objc_msgSend(v18, "isEqual:"))
        {
          v9 = 0;
          v19 = (void *)v17;
          v20 = (void *)v63;
          v15 = v70;
          goto LABEL_26;
        }
      }
      v21 = -[FUFlight flightNumber](self, "flightNumber");
      if (v21 != objc_msgSend(v5, "flightNumber"))
      {
        v9 = 0;
        v19 = v64;
        v20 = (void *)v63;
        v15 = v70;
        if (v64 == (void *)v63)
          goto LABEL_27;
        goto LABEL_26;
      }
      -[FUFlight cancellationMessage](self, "cancellationMessage");
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cancellationMessage");
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = (void *)v22;
      v23 = v22 == v59;
      v15 = v70;
      if (!v23)
      {
        -[FUFlight cancellationMessage](self, "cancellationMessage");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "cancellationMessage");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v24;
        if (!objc_msgSend(v24, "isEqual:", v55))
        {
          v9 = 0;
          v26 = (void *)v59;
          v25 = v60;
LABEL_59:

LABEL_60:
          v19 = v64;
          v20 = (void *)v63;
          if (v64 == (void *)v63)
          {
LABEL_27:

            v14 = v65;
            v3 = v66;
            if (v65 == v72)
              goto LABEL_29;
            goto LABEL_28;
          }
LABEL_26:

          goto LABEL_27;
        }
      }
      -[FUFlight allLegs](self, "allLegs");
      v28 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allLegs");
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = (void *)v28;
      if (v28 != v57)
      {
        -[FUFlight allLegs](self, "allLegs");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "allLegs");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v29;
        if (!objc_msgSend(v29, "isEqual:"))
        {
          v9 = 0;
          v30 = (void *)v57;
LABEL_57:

LABEL_58:
          v26 = (void *)v59;
          v25 = v60;
          if (v60 == (void *)v59)
            goto LABEL_60;
          goto LABEL_59;
        }
      }
      -[FUFlight legs](self, "legs");
      v31 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "legs");
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = (void *)v31;
      if (v31 != v53)
      {
        -[FUFlight legs](self, "legs");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "legs");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v32;
        if (!objc_msgSend(v32, "isEqual:"))
        {
          v9 = 0;
          v33 = (void *)v53;
LABEL_55:

LABEL_56:
          v30 = (void *)v57;
          if (v58 == (void *)v57)
            goto LABEL_58;
          goto LABEL_57;
        }
      }
      -[FUFlight identifier](self, "identifier");
      v34 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = (void *)v34;
      if (v34 != v49)
      {
        -[FUFlight identifier](self, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v35;
        if (!objc_msgSend(v35, "isEqual:"))
        {
          v9 = 0;
          v42 = (void *)v49;
          goto LABEL_53;
        }
        v34 = (uint64_t)v50;
      }
      v36 = -[FUFlight departureLegIndex](self, "departureLegIndex");
      if (v36 == objc_msgSend(v5, "departureLegIndex")
        && (v37 = -[FUFlight arrivalLegIndex](self, "arrivalLegIndex"), v37 == objc_msgSend(v5, "arrivalLegIndex")))
      {
        -[FUFlight expirationDate](self, "expirationDate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "expirationDate");
        v39 = objc_claimAutoreleasedReturnValue();
        if (v38 == (void *)v39)
        {

          v9 = 1;
        }
        else
        {
          v44 = (void *)v39;
          -[FUFlight expirationDate](self, "expirationDate");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "expirationDate");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v43, "isEqual:", v40);

        }
        v42 = (void *)v49;
        v41 = v50;
      }
      else
      {
        v9 = 0;
        v41 = (void *)v34;
        v42 = (void *)v49;
      }
      v15 = v70;
      if (v41 == v42)
      {
LABEL_54:

        v33 = (void *)v53;
        if (v54 == (void *)v53)
          goto LABEL_56;
        goto LABEL_55;
      }
LABEL_53:

      goto LABEL_54;
    }
    v9 = 0;
    v15 = v70;
    if (v14 == v72)
    {
LABEL_29:

      v13 = v68;
      v12 = v69;
      if (v10 == v11)
        goto LABEL_31;
      goto LABEL_30;
    }
LABEL_28:

    goto LABEL_29;
  }
  v9 = 0;
LABEL_34:

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v14 = (void *)MEMORY[0x24BDD17C8];
  -[FUFlight flightCode](self, "flightCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlight airline](self, "airline");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlight departure](self, "departure");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "airport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "IATACode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlight arrival](self, "arrival");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "airport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "IATACode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlight allLegs](self, "allLegs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("Flight: %@ (%@) %@ => %@ Legs: %@"), v3, v4, v7, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setFlightNumber:", -[FUFlight flightNumber](self, "flightNumber"));
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[FUFlight allLegs](self, "allLegs", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "setAllLegs:", v5);
  -[FUFlight airline](self, "airline");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setAirline:", v12);

  -[FUFlight cancellationMessage](self, "cancellationMessage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setCancellationMessage:", v14);

  objc_msgSend(v4, "setDepartureLegIndex:arrivalLegIndex:", -[FUFlight departureLegIndex](self, "departureLegIndex"), -[FUFlight arrivalLegIndex](self, "arrivalLegIndex"));
  return v4;
}

- (id)legsAsFlights
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  FUFlight *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[FUFlight legs](self, "legs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
        v9 = objc_alloc_init(FUFlight);
        -[FUFlight airline](self, "airline");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[FUFlight setAirline:](v9, "setAirline:", v10);

        -[FUFlight setFlightNumber:](v9, "setFlightNumber:", -[FUFlight flightNumber](self, "flightNumber"));
        -[FUFlight cancellationMessage](self, "cancellationMessage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[FUFlight setCancellationMessage:](v9, "setCancellationMessage:", v11);

        v12 = (void *)objc_msgSend(v8, "copy");
        v20 = v12;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[FUFlight setAllLegs:](v9, "setAllLegs:", v13);

        objc_msgSend(v3, "addObject:", v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v5);
  }

  return v3;
}

- (NSString)flightCode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[FUFlight airline](self, "airline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "IATACode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%ld"), v5, -[FUFlight flightNumber](self, "flightNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)displayFlightCode
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[FUFlight queriedAirlineTitle](self, "queriedAirlineTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%ld"), v4, -[FUFlight displayFlightNumber](self, "displayFlightNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setAllLegs:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_allLegs, a3);
  v5 = a3;
  -[FUFlight setDepartureLegIndex:](self, "setDepartureLegIndex:", 0);
  -[FUFlight setArrivalLegIndex:](self, "setArrivalLegIndex:", objc_msgSend(v5, "count") - 1);
  -[FUFlight setLegs:](self, "setLegs:", v5);

}

- (void)setDepartureLegIndex:(unint64_t)a3 arrivalLegIndex:(unint64_t)a4
{
  void *v7;
  id v8;

  -[FUFlight setDepartureLegIndex:](self, "setDepartureLegIndex:");
  -[FUFlight setArrivalLegIndex:](self, "setArrivalLegIndex:", a4);
  -[FUFlight allLegs](self, "allLegs");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subarrayWithRange:", a3, a4 - a3 + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlight setLegs:](self, "setLegs:", v7);

}

- (int64_t)status
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  unint64_t v8;
  int64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[FUFlight legs](self, "legs", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "status");
        if (v8 <= 6)
        {
          v9 = v8;
          if (((1 << v8) & 0x30) != 0)
          {
            v5 = v8;
          }
          else if (v8 == 1)
          {
            if (v5 == 4)
            {
              v9 = 2;
              goto LABEL_20;
            }
            if (v5 == 5)
            {
              v9 = 3;
              goto LABEL_20;
            }
            v5 = 1;
          }
          else if (((1 << v8) & 0x4C) != 0)
          {
            goto LABEL_20;
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = v5;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_20:

  return v9;
}

- (id)relevantLeg
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[FUFlight legs](self, "legs", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
        v9 = objc_msgSend(v8, "status");
        if (v9 <= 6)
        {
          if (((1 << v9) & 0x30) != 0)
          {
            v10 = v8;

            v5 = v10;
          }
          else if (((1 << v9) & 0x4E) != 0)
          {
            v12 = v8;

            goto LABEL_17;
          }
        }
        ++v7;
      }
      while (v4 != v7);
      v11 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v4 = v11;
    }
    while (v11);
  }
  else
  {
    v5 = 0;
  }

  v5 = v5;
  v12 = v5;
LABEL_17:

  return v12;
}

- (id)firstLeg
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[FUFlight legs](self, "legs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[FUFlight legs](self, "legs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)lastLeg
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[FUFlight legs](self, "legs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[FUFlight legs](self, "legs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (FUFlightStep)departure
{
  void *v2;
  void *v3;

  -[FUFlight firstLeg](self, "firstLeg");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "departure");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FUFlightStep *)v3;
}

- (FUFlightStep)arrival
{
  void *v2;
  void *v3;

  -[FUFlight lastLeg](self, "lastLeg");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrival");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FUFlightStep *)v3;
}

- (double)duration
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FUFlight legs](self, "legs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "duration");
  v5 = v4;

  return v5;
}

- (NSString)identifier
{
  NSString *identifier;
  NSString *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  NSString *v20;
  void *v22;
  void *v23;

  identifier = self->_identifier;
  if (identifier)
  {
    v3 = identifier;
  }
  else
  {
    +[FUFlight timeFormatterForIdentifier](FUFlight, "timeFormatterForIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlight allLegs](self, "allLegs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "departure");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "airport");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTimeZone:", v9);

    v22 = (void *)MEMORY[0x24BDD17C8];
    -[FUFlight airline](self, "airline");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "IATACode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[FUFlight flightNumber](self, "flightNumber");
    -[FUFlight departure](self, "departure");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "airport");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "IATACode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlight arrival](self, "arrival");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "airport");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "IATACode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%@-%ld-%@-%@"), v11, v12, v15, v18);
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    v20 = self->_identifier;
    self->_identifier = v19;

    v3 = self->_identifier;
  }
  return v3;
}

+ (id)timeFormatterForIdentifier
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("ddMMyyyy"));
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCalendar:", v4);

  return v2;
}

+ (void)loadFlightsWithNumber:(unint64_t)a3 airlineCode:(id)a4 date:(id)a5 dateType:(int64_t)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;

  v11 = a7;
  v12 = a5;
  v13 = a4;
  -[objc_class loadFlightsWithNumber:airlineCode:date:dateType:completionHandler:](+[FUFlightFactory flightFactoryClassWithProvider:](FUFlightFactory, "flightFactoryClassWithProvider:", CFSTR("FUFactoryProvider_Default")), "loadFlightsWithNumber:airlineCode:date:dateType:completionHandler:", a3, v13, v12, a6, v11);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  -[FUFlight codeShares](self, "codeShares");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FUFlight codeShares](self, "codeShares");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v5, CFSTR("codeShares"));

  }
  -[FUFlight displayAirline](self, "displayAirline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FUFlight displayAirline](self, "displayAirline");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v7, CFSTR("displayAirline"));

  }
  -[FUFlight queriedAirlineTitle](self, "queriedAirlineTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FUFlight queriedAirlineTitle](self, "queriedAirlineTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v9, CFSTR("queriedAirlineTitle"));

  }
  objc_msgSend(v24, "encodeInteger:forKey:", -[FUFlight displayFlightNumber](self, "displayFlightNumber"), CFSTR("displayFlightNumber"));
  -[FUFlight airline](self, "airline");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FUFlight airline](self, "airline");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v11, CFSTR("airline"));

  }
  objc_msgSend(v24, "encodeInteger:forKey:", -[FUFlight flightNumber](self, "flightNumber"), CFSTR("flightNumber"));
  -[FUFlight cancellationMessage](self, "cancellationMessage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[FUFlight cancellationMessage](self, "cancellationMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v13, CFSTR("cancellationMessage"));

  }
  -[FUFlight allLegs](self, "allLegs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[FUFlight allLegs](self, "allLegs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v15, CFSTR("allLegs"));

  }
  -[FUFlight legs](self, "legs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[FUFlight legs](self, "legs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v17, CFSTR("legs"));

  }
  -[FUFlight identifier](self, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[FUFlight identifier](self, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v19, CFSTR("identifier"));

  }
  objc_msgSend(v24, "encodeInteger:forKey:", -[FUFlight departureLegIndex](self, "departureLegIndex"), CFSTR("departureLegIndex"));
  objc_msgSend(v24, "encodeInteger:forKey:", -[FUFlight arrivalLegIndex](self, "arrivalLegIndex"), CFSTR("arrivalLegIndex"));
  -[FUFlight expirationDate](self, "expirationDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[FUFlight expirationDate](self, "expirationDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v21, CFSTR("expirationDate"));

  }
  -[FUFlight rawResponse](self, "rawResponse");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[FUFlight rawResponse](self, "rawResponse");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v23, CFSTR("rawResponse"));

  }
}

- (FUFlight)initWithCoder:(id)a3
{
  id v4;
  FUFlight *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *codeShares;
  uint64_t v11;
  FUAirline *displayAirline;
  uint64_t v13;
  NSString *queriedAirlineTitle;
  uint64_t v15;
  FUAirline *airline;
  uint64_t v17;
  NSString *cancellationMessage;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSArray *allLegs;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSArray *legs;
  uint64_t v29;
  NSString *identifier;
  uint64_t v31;
  uint64_t v32;
  NSDate *expirationDate;
  uint64_t v34;
  NSString *rawResponse;
  FUFlight *v36;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)FUFlight;
  v5 = -[FUFlight init](&v38, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("codeShares"));
    v9 = objc_claimAutoreleasedReturnValue();
    codeShares = v5->_codeShares;
    v5->_codeShares = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayAirline"));
    v11 = objc_claimAutoreleasedReturnValue();
    displayAirline = v5->_displayAirline;
    v5->_displayAirline = (FUAirline *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("queriedAirlineTitle"));
    v13 = objc_claimAutoreleasedReturnValue();
    queriedAirlineTitle = v5->_queriedAirlineTitle;
    v5->_queriedAirlineTitle = (NSString *)v13;

    v5->_displayFlightNumber = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("displayFlightNumber"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("airline"));
    v15 = objc_claimAutoreleasedReturnValue();
    airline = v5->_airline;
    v5->_airline = (FUAirline *)v15;

    v5->_flightNumber = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("flightNumber"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cancellationMessage"));
    v17 = objc_claimAutoreleasedReturnValue();
    cancellationMessage = v5->_cancellationMessage;
    v5->_cancellationMessage = (NSString *)v17;

    v19 = (void *)MEMORY[0x24BDBCF20];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("allLegs"));
    v22 = objc_claimAutoreleasedReturnValue();
    allLegs = v5->_allLegs;
    v5->_allLegs = (NSArray *)v22;

    v24 = (void *)MEMORY[0x24BDBCF20];
    v25 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("legs"));
    v27 = objc_claimAutoreleasedReturnValue();
    legs = v5->_legs;
    v5->_legs = (NSArray *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v29 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v29;

    v5->_departureLegIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("departureLegIndex"));
    v31 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("arrivalLegIndex"));
    v5->_arrivalLegIndex = v31;
    -[FUFlight setDepartureLegIndex:arrivalLegIndex:](v5, "setDepartureLegIndex:arrivalLegIndex:", v5->_departureLegIndex, v31);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v32 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawResponse"));
    v34 = objc_claimAutoreleasedReturnValue();
    rawResponse = v5->_rawResponse;
    v5->_rawResponse = (NSString *)v34;

    v36 = v5;
  }

  return v5;
}

- (NSString)queriedAirlineTitle
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueriedAirlineTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (FUAirline)displayAirline
{
  return (FUAirline *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisplayAirline:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)displayFlightNumber
{
  return self->_displayFlightNumber;
}

- (void)setDisplayFlightNumber:(unint64_t)a3
{
  self->_displayFlightNumber = a3;
}

- (FUAirline)airline
{
  return (FUAirline *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAirline:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)flightNumber
{
  return self->_flightNumber;
}

- (void)setFlightNumber:(unint64_t)a3
{
  self->_flightNumber = a3;
}

- (NSString)flightIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFlightIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)cancellationMessage
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCancellationMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)legs
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLegs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSArray)codeShares
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCodeShares:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSArray)allLegs
{
  return self->_allLegs;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)departureLegIndex
{
  return self->_departureLegIndex;
}

- (void)setDepartureLegIndex:(unint64_t)a3
{
  self->_departureLegIndex = a3;
}

- (unint64_t)arrivalLegIndex
{
  return self->_arrivalLegIndex;
}

- (void)setArrivalLegIndex:(unint64_t)a3
{
  self->_arrivalLegIndex = a3;
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)rawResponse
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setRawResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawResponse, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_allLegs, 0);
  objc_storeStrong((id *)&self->_codeShares, 0);
  objc_storeStrong((id *)&self->_legs, 0);
  objc_storeStrong((id *)&self->_cancellationMessage, 0);
  objc_storeStrong((id *)&self->_flightIdentifier, 0);
  objc_storeStrong((id *)&self->_airline, 0);
  objc_storeStrong((id *)&self->_displayAirline, 0);
  objc_storeStrong((id *)&self->_queriedAirlineTitle, 0);
}

@end
