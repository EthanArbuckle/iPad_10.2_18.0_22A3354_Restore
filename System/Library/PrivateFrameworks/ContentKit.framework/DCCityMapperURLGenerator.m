@implementation DCCityMapperURLGenerator

- (id)scheme
{
  __CFString *v2;

  v2 = CFSTR("citymapper");
  return CFSTR("citymapper");
}

- (id)host
{
  return CFSTR("directions");
}

- (id)path
{
  return 0;
}

- (void)populateQueryDictionary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  -[DCMapsURLGenerator queryDictionary](self, "queryDictionary");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[DCMapsURLGenerator mapsLink](self, "mapsLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCCityMapperURLGenerator startCoordinate](self, "startCoordinate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "centerLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v3, "searchLocation");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v9;

  }
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v19, "setObject:forKey:", v6, CFSTR("startcoord"));
  -[DCCityMapperURLGenerator endCoordinate](self, "endCoordinate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    -[DCCityMapperURLGenerator endCoordinate](self, "endCoordinate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v12, CFSTR("endcoord"));

  }
  objc_msgSend(v3, "startAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    objc_msgSend(v3, "startAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v15, CFSTR("startaddress"));

  }
  objc_msgSend(v3, "destinationAddress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v17)
  {
    objc_msgSend(v3, "destinationAddress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v18, CFSTR("endaddress"));

  }
}

- (NSString)startCoordinate
{
  return self->_startCoordinate;
}

- (void)setStartCoordinate:(id)a3
{
  objc_storeStrong((id *)&self->_startCoordinate, a3);
}

- (NSString)endCoordinate
{
  return self->_endCoordinate;
}

- (void)setEndCoordinate:(id)a3
{
  objc_storeStrong((id *)&self->_endCoordinate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endCoordinate, 0);
  objc_storeStrong((id *)&self->_startCoordinate, 0);
}

+ (void)generateURLWithMapsLink:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __70__DCCityMapperURLGenerator_generateURLWithMapsLink_completionHandler___block_invoke;
    v7[3] = &unk_24C4DE8D8;
    v8 = v5;
    v9 = v6;
    objc_msgSend(v8, "geocodeDirectionsEndpointsWithCompletionHandler:", v7);

  }
}

void __70__DCCityMapperURLGenerator_generateURLWithMapsLink_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  DCCityMapperURLGenerator *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;

  v23 = a2;
  v5 = a3;
  v6 = -[DCMapsURLGenerator initWithMapsLink:]([DCCityMapperURLGenerator alloc], "initWithMapsLink:", *(_QWORD *)(a1 + 32));
  if (v23)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v23, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinate");
    v10 = v9;
    objc_msgSend(v23, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "coordinate");
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%f,%f"), v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCCityMapperURLGenerator setStartCoordinate:](v6, "setStartCoordinate:", v13);

  }
  if (v5)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "coordinate");
    v17 = v16;
    objc_msgSend(v5, "location");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "coordinate");
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%f,%f"), v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCCityMapperURLGenerator setEndCoordinate:](v6, "setEndCoordinate:", v20);

  }
  v21 = *(_QWORD *)(a1 + 40);
  -[DCMapsURLGenerator URL](v6, "URL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v21 + 16))(v21, v22, 0);

}

@end
