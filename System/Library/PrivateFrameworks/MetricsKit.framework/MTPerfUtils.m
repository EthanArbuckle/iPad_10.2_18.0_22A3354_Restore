@implementation MTPerfUtils

- (id)DNSServersIPAddresses
{
  id v2;
  __res_9_state *v3;
  res_9_sockaddr_union *v4;
  unint64_t v5;
  char *v6;
  int v7;
  int v8;
  char *v9;
  socklen_t v10;
  void *v11;
  void *v12;
  char v14[46];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = (__res_9_state *)malloc_type_calloc(1uLL, 0x228uLL, 0x10B20402089BC1DuLL);
  if (!res_9_ninit(v3))
  {
    v4 = (res_9_sockaddr_union *)malloc_type_malloc((uint64_t)v3->nscount << 7, 0x1000040AE2C30F4uLL);
    res_9_getservers(v3, v4, v3->nscount);
    if (v3->nscount)
    {
      v5 = 0;
      v6 = &v4->__space[4];
      while (1)
      {
        v7 = *(v6 - 3);
        if (v7 == 30)
          break;
        if (v7 == 2)
        {
          v8 = 2;
          v9 = v6;
          v10 = 16;
          goto LABEL_8;
        }
LABEL_10:
        ++v5;
        v6 += 128;
        if (v5 >= v3->nscount)
          goto LABEL_11;
      }
      v9 = v6 + 4;
      v8 = 30;
      v10 = 46;
LABEL_8:
      inet_ntop(v8, v9, v14, v10);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v2, "addObject:", v11);

      }
      goto LABEL_10;
    }
LABEL_11:
    free(v4);
  }
  res_9_ndestroy(v3);
  free(v3);
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(","));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)loadUrlMeasurementWithURLSessionTaskTransactionMetrics:(id)a3
{
  id v4;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v4 = a3;
  -[MTObject metricsKit](self, "metricsKit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadUrlMeasurement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fetchStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "fetchStartDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mark:date:", CFSTR("fetchStartTime"), v8);

  }
  objc_msgSend(v4, "domainLookupStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "domainLookupStartDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mark:date:", CFSTR("domainLookupStartTime"), v10);

  }
  objc_msgSend(v4, "domainLookupEndDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "domainLookupEndDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mark:date:", CFSTR("domainLookupEndTime"), v12);

  }
  objc_msgSend(v4, "connectStartDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "connectStartDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mark:date:", CFSTR("connectionStartTime"), v14);

  }
  objc_msgSend(v4, "connectEndDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v4, "connectEndDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mark:date:", CFSTR("connectionEndTime"), v16);

  }
  objc_msgSend(v4, "secureConnectionStartDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v4, "secureConnectionStartDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mark:date:", CFSTR("secureConnectionStartTime"), v18);

  }
  objc_msgSend(v4, "requestStartDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v4, "requestStartDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mark:date:", CFSTR("requestStartTime"), v20);

  }
  objc_msgSend(v4, "responseStartDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v4, "responseStartDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mark:date:", CFSTR("responseStartTime"), v22);

  }
  objc_msgSend(v4, "responseEndDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v4, "responseEndDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mark:date:", CFSTR("responseEndTime"), v24);

  }
  objc_msgSend(v6, "setConnectionReused:", objc_msgSend(v4, "isReusedConnection"));
  objc_msgSend(v4, "request");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "URL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "absoluteString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v4, "request");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "URL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "absoluteString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRequestUrl:", v30);

  }
  objc_msgSend(v4, "response");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
    objc_msgSend(v6, "setStatusCode:", objc_msgSend(v31, "statusCode"));

  return v6;
}

- (id)loadUrlMeasurementWithURLSessionTaskMetrics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "transactionMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MTPerfUtils loadUrlMeasurementWithURLSessionTaskTransactionMetrics:](self, "loadUrlMeasurementWithURLSessionTaskTransactionMetrics:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRedirectCount:", objc_msgSend(v4, "redirectCount"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
