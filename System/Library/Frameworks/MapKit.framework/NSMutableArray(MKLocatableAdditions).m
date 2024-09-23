@implementation NSMutableArray(MKLocatableAdditions)

- (id)_mapkit_popLastObject
{
  void *v2;

  objc_msgSend(a1, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeLastObject");
  return v2;
}

- (uint64_t)_mapkit_sortUsingLatitude
{
  return objc_msgSend(a1, "_mapkit_sortUsingLatitudeAscending:", 1);
}

- (uint64_t)_mapkit_sortUsingLatitudeAscending:()MKLocatableAdditions
{
  uint64_t v4;
  __int128 v5;
  _BYTE v6[40];
  uint64_t v7;

  v4 = 0;
  memset(v6, 0, sizeof(v6));
  v7 = 0;
  v5 = MKCoordinateInvalid;
  *(_OWORD *)v6 = *MEMORY[0x1E0C9D538];
  *(_OWORD *)&v6[16] = *(_OWORD *)v6;
  v7 = a3 ^ 1u;
  return objc_msgSend(a1, "sortUsingFunction:context:", MKCompareLocatableObjects, &v4);
}

- (uint64_t)_mapkit_sortUsingLongitude
{
  return objc_msgSend(a1, "_mapkit_sortUsingLongitudeAscending:", 1);
}

- (uint64_t)_mapkit_sortUsingLongitudeAscending:()MKLocatableAdditions
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v4 = 1;
  v5 = MKCoordinateInvalid;
  v6 = *MEMORY[0x1E0C9D538];
  v7 = v6;
  v8 = 0;
  v9 = a3 ^ 1u;
  return objc_msgSend(a1, "sortUsingFunction:context:", MKCompareLocatableObjects, &v4);
}

- (uint64_t)_mapkit_sortUsingDistanceFromCoordinate:()MKLocatableAdditions
{
  return objc_msgSend(a1, "_mapkit_sortUsingDistanceFromCoordinate:ascending:", 1);
}

- (uint64_t)_mapkit_sortUsingDistanceFromCoordinate:()MKLocatableAdditions ascending:
{
  _QWORD v6[3];
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v6[0] = 2;
  *(double *)&v6[1] = a2;
  *(double *)&v6[2] = a3;
  v7 = *MEMORY[0x1E0C9D538];
  v8 = v7;
  v9 = 0;
  v10 = a5 ^ 1u;
  return objc_msgSend(a1, "sortUsingFunction:context:", MKCompareLocatableObjects, v6);
}

- (uint64_t)_mapkit_insertObject:()MKLocatableAdditions sortedUsingSelector:
{
  uint64_t v7;
  _QWORD v9[5];

  v7 = objc_msgSend(a1, "count");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__NSMutableArray_MKLocatableAdditions___mapkit_insertObject_sortedUsingSelector___block_invoke;
  v9[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v9[4] = a4;
  return objc_msgSend(a1, "insertObject:atIndex:", a3, objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", a3, 0, v7, 1024, v9));
}

@end
