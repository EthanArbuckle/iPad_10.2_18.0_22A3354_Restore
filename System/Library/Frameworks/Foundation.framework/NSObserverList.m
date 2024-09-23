@implementation NSObserverList

size_t __59___NSObserverList__copyObserversOfObject_creatingIfAbsent___block_invoke()
{
  size_t result;

  qword_1ECD0A898 = objc_opt_class();
  result = class_getInstanceSize((Class)qword_1ECD0A898);
  qword_1ECD0A890 = result;
  return result;
}

size_t __48___NSObserverList_destroyObserverListForObject___block_invoke(uint64_t a1)
{
  size_t result;

  result = class_getInstanceSize(*(Class *)(a1 + 32));
  qword_1ECD0A8A8 = result;
  return result;
}

void __31___NSObserverList__receiveBox___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t StackObservedValueClassAndBoxSize;
  uint64_t v14;
  Class v15;
  _DWORD *v16;
  _QWORD v17[2];
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (a3 < 2)
  {
    if (!a3)
      return;
    v6 = 0;
  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "_isToManyChangeInformation") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "conformsToProtocol:", &unk_1EDCC29F8);
  }
  v7 = 0;
  do
  {
    if (*(_QWORD *)(a2 + 8 * v7))
    {
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      if (v6)
        v9 = (id)objc_msgSend(v8, "copyWithZone:", 0);
      else
        v9 = v8;
      v10 = v9;
      v11 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v18 = __31___NSObserverList__receiveBox___block_invoke_2;
      v19 = &__block_descriptor_48_e25_v16__0__NSObservedValue_8l;
      v20 = a2;
      v21 = v7;
      v22[0] = 0;
      StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(v22);
      MEMORY[0x1E0C80A78](StackObservedValueClassAndBoxSize);
      v16 = objc_constructInstance(v15, (char *)v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
      v16[6] = v11;
      *((_QWORD *)v16 + 1) = v10;
      *((_QWORD *)v16 + 2) = v12;
      v18((uint64_t)v17, (uint64_t)v16);

    }
    ++v7;
  }
  while (a3 != v7);
}

uint64_t __31___NSObserverList__receiveBox___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8 * *(_QWORD *)(a1 + 40)), "_receiveBox:", a2);
}

uint64_t __30___NSObserverList_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v6 = [NSString alloc];
  v7 = objc_opt_class();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = objc_msgSend(a2, "count");
  result = -[NSString initWithFormat:](v6, "initWithFormat:", CFSTR("%@(%p) of %lu observers of %@: %@"), v7, v8, v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", a2, a3));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

@end
