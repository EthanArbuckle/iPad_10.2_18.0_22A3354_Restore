@implementation ASFAsn1SetToken

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SET Token. (length:%ld)"), -[NSData length](self->super.mData, "length"));
}

- (id)nextToken
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;

  if (!a1 || !objc_msgSend(*(id *)(a1 + 32), "length"))
    return 0;
  v9 = 0;
  +[ASFAsn1Token readTokenFromBuffer:length:]((uint64_t)ASFAsn1Token, *(void **)(a1 + 32), &v9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = v9;
  v5 = objc_msgSend(v3, "length");
  objc_msgSend(v3, "subdataWithRange:", v4, v5 - v9);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v6;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mReadData, 0);
}

@end
