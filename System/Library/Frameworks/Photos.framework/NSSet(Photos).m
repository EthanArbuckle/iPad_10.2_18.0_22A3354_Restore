@implementation NSSet(Photos)

- (void)ph_enumerateIntersectionWithSet:()Photos usingBlock:
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "count");
  v9 = objc_msgSend(v6, "count");
  v10 = a1;
  v11 = v8 >= v9;
  if (v8 >= v9)
    v12 = v6;
  else
    v12 = v10;
  if (v11)
    v13 = v10;
  else
    v13 = v6;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __60__NSSet_Photos__ph_enumerateIntersectionWithSet_usingBlock___block_invoke;
  v17[3] = &unk_1E35D5D40;
  v18 = v13;
  v19 = v7;
  v14 = v7;
  v15 = v13;
  v16 = v6;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v17);

}

@end
