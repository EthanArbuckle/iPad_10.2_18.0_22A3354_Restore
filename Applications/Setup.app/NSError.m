@implementation NSError

- (void)buddy_enumerateErrorTreeWithHandler:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;
  id v9;
  id v10;
  id location[2];
  NSError *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = objc_opt_new(NSMutableSet);
  v9 = +[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v12);
  v8 = 0;
  v7 = 0;
  while (1)
  {
    v3 = -[NSError buddy_popFrom:](v12, "buddy_popFrom:", v9);
    v4 = v7;
    v7 = v3;

    if (!v3)
      break;
    if ((objc_msgSend(v10, "containsObject:", v7) & 1) == 0)
    {
      objc_msgSend(v10, "addObject:", v7);
      (*((void (**)(id, id, char *))location[0] + 2))(location[0], v7, &v8);
      if ((v8 & 1) != 0)
        break;
      v5 = v9;
      v6 = objc_msgSend(v7, "underlyingErrors");
      objc_msgSend(v5, "addObjectsFromArray:", v6);

    }
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (id)buddy_popFrom:(id)a3
{
  id v3;
  id v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = objc_msgSend(location[0], "lastObject");
  objc_msgSend(location[0], "removeLastObject");
  v3 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v3;
}

@end
