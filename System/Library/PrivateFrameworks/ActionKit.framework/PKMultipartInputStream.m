@implementation PKMultipartInputStream

- (void)updateLength
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  -[PKMultipartInputStream footer](self, "footer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "length");
  -[PKMultipartInputStream parts](self, "parts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", CFSTR("@sum.length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMultipartInputStream setLength:](self, "setLength:", objc_msgSend(v5, "unsignedIntegerValue") + v3);

}

- (PKMultipartInputStream)init
{
  PKMultipartInputStream *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKMultipartInputStream;
  v2 = -[PKMultipartInputStream init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMultipartInputStream setParts:](v2, "setParts:", v3);

    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "globallyUniqueString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMultipartInputStream setBoundary:](v2, "setBoundary:", v5);

    v6 = (void *)MEMORY[0x24BDD17C8];
    -[PKMultipartInputStream boundary](v2, "boundary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("--%@--\r\n"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataUsingEncoding:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMultipartInputStream setFooter:](v2, "setFooter:", v9);

    -[PKMultipartInputStream updateLength](v2, "updateLength");
  }
  return v2;
}

- (void)addPartWithName:(id)a3 string:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKMultipartElement *v9;
  void *v10;
  PKMultipartElement *v11;

  v6 = a4;
  v7 = a3;
  -[PKMultipartInputStream parts](self, "parts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [PKMultipartElement alloc];
  -[PKMultipartInputStream boundary](self, "boundary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PKMultipartElement initWithName:boundary:string:](v9, "initWithName:boundary:string:", v7, v10, v6);

  objc_msgSend(v8, "addObject:", v11);
  -[PKMultipartInputStream updateLength](self, "updateLength");
}

- (void)addPartWithName:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKMultipartElement *v9;
  void *v10;
  PKMultipartElement *v11;

  v6 = a4;
  v7 = a3;
  -[PKMultipartInputStream parts](self, "parts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [PKMultipartElement alloc];
  -[PKMultipartInputStream boundary](self, "boundary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PKMultipartElement initWithName:boundary:data:contentType:](v9, "initWithName:boundary:data:contentType:", v7, v10, v6, CFSTR("application/octet-stream"));

  objc_msgSend(v8, "addObject:", v11);
  -[PKMultipartInputStream updateLength](self, "updateLength");
}

- (void)addPartWithName:(id)a3 data:(id)a4 contentType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PKMultipartElement *v12;
  void *v13;
  PKMultipartElement *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PKMultipartInputStream parts](self, "parts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [PKMultipartElement alloc];
  -[PKMultipartInputStream boundary](self, "boundary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKMultipartElement initWithName:boundary:data:contentType:](v12, "initWithName:boundary:data:contentType:", v10, v13, v9, v8);

  objc_msgSend(v11, "addObject:", v14);
  -[PKMultipartInputStream updateLength](self, "updateLength");
}

- (void)addPartWithName:(id)a3 filename:(id)a4 data:(id)a5 contentType:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  PKMultipartElement *v15;
  void *v16;
  PKMultipartElement *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[PKMultipartInputStream parts](self, "parts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [PKMultipartElement alloc];
  -[PKMultipartInputStream boundary](self, "boundary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PKMultipartElement initWithName:boundary:data:contentType:filename:](v15, "initWithName:boundary:data:contentType:filename:", v13, v16, v11, v10, v12);

  objc_msgSend(v14, "addObject:", v17);
  -[PKMultipartInputStream updateLength](self, "updateLength");
}

- (void)addPartWithName:(id)a3 path:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKMultipartElement *v9;
  void *v10;
  PKMultipartElement *v11;

  v6 = a4;
  v7 = a3;
  -[PKMultipartInputStream parts](self, "parts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [PKMultipartElement alloc];
  -[PKMultipartInputStream boundary](self, "boundary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PKMultipartElement initWithName:filename:boundary:path:](v9, "initWithName:filename:boundary:path:", v7, 0, v10, v6);

  objc_msgSend(v8, "addObject:", v11);
  -[PKMultipartInputStream updateLength](self, "updateLength");
}

- (void)addPartWithName:(id)a3 filename:(id)a4 path:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PKMultipartElement *v12;
  void *v13;
  PKMultipartElement *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PKMultipartInputStream parts](self, "parts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [PKMultipartElement alloc];
  -[PKMultipartInputStream boundary](self, "boundary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKMultipartElement initWithName:filename:boundary:path:](v12, "initWithName:filename:boundary:path:", v10, v9, v13, v8);

  objc_msgSend(v11, "addObject:", v14);
  -[PKMultipartInputStream updateLength](self, "updateLength");
}

- (void)addPartWithName:(id)a3 filename:(id)a4 path:(id)a5 contentType:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  PKMultipartElement *v15;
  void *v16;
  PKMultipartElement *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[PKMultipartInputStream parts](self, "parts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [PKMultipartElement alloc];
  -[PKMultipartInputStream boundary](self, "boundary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PKMultipartElement initWithName:filename:boundary:path:contentType:](v15, "initWithName:filename:boundary:path:contentType:", v13, v12, v16, v11, v10);

  objc_msgSend(v14, "addObject:", v17);
  -[PKMultipartInputStream updateLength](self, "updateLength");
}

- (void)addPartWithName:(id)a3 filename:(id)a4 stream:(id)a5 streamLength:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  PKMultipartElement *v14;
  void *v15;
  PKMultipartElement *v16;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[PKMultipartInputStream parts](self, "parts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [PKMultipartElement alloc];
  -[PKMultipartInputStream boundary](self, "boundary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PKMultipartElement initWithName:filename:boundary:stream:streamLength:](v14, "initWithName:filename:boundary:stream:streamLength:", v12, v11, v15, v10, a6);

  objc_msgSend(v13, "addObject:", v16);
  -[PKMultipartInputStream updateLength](self, "updateLength");
}

- (void)addPartWithHeaders:(id)a3 string:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKMultipartElement *v9;
  void *v10;
  PKMultipartElement *v11;

  v6 = a4;
  v7 = a3;
  -[PKMultipartInputStream parts](self, "parts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [PKMultipartElement alloc];
  -[PKMultipartInputStream boundary](self, "boundary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PKMultipartElement initWithHeaders:string:boundary:](v9, "initWithHeaders:string:boundary:", v7, v6, v10);

  objc_msgSend(v8, "addObject:", v11);
  -[PKMultipartInputStream updateLength](self, "updateLength");
}

- (void)addPartWithHeaders:(id)a3 path:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKMultipartElement *v9;
  void *v10;
  PKMultipartElement *v11;

  v6 = a4;
  v7 = a3;
  -[PKMultipartInputStream parts](self, "parts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [PKMultipartElement alloc];
  -[PKMultipartInputStream boundary](self, "boundary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PKMultipartElement initWithHeaders:path:boundary:](v9, "initWithHeaders:path:boundary:", v7, v6, v10);

  objc_msgSend(v8, "addObject:", v11);
  -[PKMultipartInputStream updateLength](self, "updateLength");
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  unint64_t v7;
  unint64_t v8;
  _BOOL4 v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;

  -[PKMultipartInputStream setStatus:](self, "setStatus:", 3);
  v7 = -[PKMultipartInputStream delivered](self, "delivered");
  v8 = 0;
  v9 = a4 != 0;
  if (v7 < -[PKMultipartInputStream length](self, "length") && a4)
  {
    v8 = 0;
    while (1)
    {
      v10 = -[PKMultipartInputStream currentPart](self, "currentPart");
      -[PKMultipartInputStream parts](self, "parts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v10 >= v12)
        break;
      -[PKMultipartInputStream parts](self, "parts");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", -[PKMultipartInputStream currentPart](self, "currentPart"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "read:maxLength:", &a3[v8], a4 - v8);

      if (v15)
      {
        v8 += v15;
        -[PKMultipartInputStream setDelivered:](self, "setDelivered:", -[PKMultipartInputStream delivered](self, "delivered") + v15);
        v17 = -[PKMultipartInputStream delivered](self, "delivered");
        v9 = v8 < a4;
        if (v17 >= -[PKMultipartInputStream length](self, "length") || v8 >= a4)
          goto LABEL_12;
      }
      else
      {
        -[PKMultipartInputStream setCurrentPart:](self, "setCurrentPart:", -[PKMultipartInputStream currentPart](self, "currentPart") + 1);
        v16 = -[PKMultipartInputStream delivered](self, "delivered");
        if (v16 >= -[PKMultipartInputStream length](self, "length"))
          break;
      }
    }
    v9 = 1;
  }
LABEL_12:
  v18 = -[PKMultipartInputStream delivered](self, "delivered");
  v19 = -[PKMultipartInputStream length](self, "length");
  -[PKMultipartInputStream footer](self, "footer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 - objc_msgSend(v20, "length");

  if (v18 >= v21 && v9)
  {
    -[PKMultipartInputStream footer](self, "footer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");
    v24 = -[PKMultipartInputStream delivered](self, "delivered");
    v25 = -[PKMultipartInputStream length](self, "length");
    -[PKMultipartInputStream footer](self, "footer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v23 + v25 - (v24 + objc_msgSend(v26, "length"));

    if (v27 >= a4 - v8)
      v28 = a4 - v8;
    else
      v28 = v27;
    -[PKMultipartInputStream footer](self, "footer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[PKMultipartInputStream delivered](self, "delivered");
    v31 = -[PKMultipartInputStream length](self, "length");
    -[PKMultipartInputStream footer](self, "footer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "getBytes:range:", &a3[v8], v30 - v31 + objc_msgSend(v32, "length"), v28);

    v8 += v28;
    -[PKMultipartInputStream setDelivered:](self, "setDelivered:", -[PKMultipartInputStream delivered](self, "delivered") + v28);
  }
  return v8;
}

- (BOOL)hasBytesAvailable
{
  unint64_t v3;

  v3 = -[PKMultipartInputStream delivered](self, "delivered");
  return v3 < -[PKMultipartInputStream length](self, "length");
}

- (void)open
{
  -[PKMultipartInputStream setStatus:](self, "setStatus:", 2);
}

- (void)close
{
  -[PKMultipartInputStream setStatus:](self, "setStatus:", 6);
}

- (unint64_t)streamStatus
{
  unint64_t v3;

  if (-[PKMultipartInputStream status](self, "status") != 6)
  {
    v3 = -[PKMultipartInputStream delivered](self, "delivered");
    if (v3 >= -[PKMultipartInputStream length](self, "length"))
      -[PKMultipartInputStream setStatus:](self, "setStatus:", 5);
  }
  return -[PKMultipartInputStream status](self, "status");
}

- (id)propertyForKey:(id)a3
{
  return 0;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return 0;
}

- (id)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (NSStreamDelegate *)a3;
}

- (NSString)boundary
{
  return self->_boundary;
}

- (void)setBoundary:(id)a3
{
  objc_storeStrong((id *)&self->_boundary, a3);
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (NSMutableArray)parts
{
  return self->_parts;
}

- (void)setParts:(id)a3
{
  objc_storeStrong((id *)&self->_parts, a3);
}

- (NSData)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_storeStrong((id *)&self->_footer, a3);
}

- (unint64_t)currentPart
{
  return self->_currentPart;
}

- (void)setCurrentPart:(unint64_t)a3
{
  self->_currentPart = a3;
}

- (unint64_t)delivered
{
  return self->_delivered;
}

- (void)setDelivered:(unint64_t)a3
{
  self->_delivered = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_parts, 0);
  objc_storeStrong((id *)&self->_boundary, 0);
}

@end
